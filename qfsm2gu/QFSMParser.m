//
//  QFSMParser.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011, 2014 Rene Hexel. All rights reserved.
//
#import "QFSMParser.h"
#import "QFSMElement.h"
#import "NSString+MixedCase.h"
#import "NSMutableArray+Stack.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
#pragma clang diagnostic ignored "-Wmissing-method-return-type"
#pragma clang diagnostic ignored "-Wimplicit-atomic-properties"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wselector"
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#pragma clang diagnostic ignored "-Wobjc-messaging-id"

@implementation QFSMParser

@synthesize delegate = _delegate;
@synthesize parser = _parser;
@synthesize error = _error;
@synthesize currentParsedCharacterData = _currentParsedCharacterData;
@synthesize currentElement = _currentElement;
@synthesize stack = _stack;
@synthesize accumulatingParsedCharacterData = isAccumulatingParsedCharacterData;

- initWithContentsOfURL: (NSURL *) url
{
        if (!(self = [super init]))
            return nil;

        self.stack = [NSMutableArray arrayWithCapacity: 16];

        _parser = [[NSXMLParser alloc] initWithContentsOfURL: url];
        _parser.delegate = self;

        return self;
}




- (void) parse
{
        self.currentParsedCharacterData = [NSMutableString string];

	[_parser setShouldProcessNamespaces: NO];
	[_parser parse];

        self.currentParsedCharacterData = nil;
}



- (void) parseXMLData: (NSData *) data
{
	@autoreleasepool {
#ifdef DEBUG
	NSLog(@"received: '%@'", [[NSString alloc] initWithData: data
							encoding: NSUTF8StringEncoding]
				  );
#endif
		NSXMLParser *parser = [[NSXMLParser alloc] initWithData: data];
		[parser setDelegate: self];
		[parser setShouldProcessNamespaces: YES];

        [self setParser: parser];
        [self parse];

	}
}


#pragma mark NSXMLParser delegate methods

- (void) parser: (NSXMLParser *) parser
didStartElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName
     attributes: (NSDictionary *) attributes
{
	NSString *selectorString = [NSString stringWithFormat: @"start%@:attributes:",
				    [elementName capitalizedMixedCaseString]];
        id delegate = _delegate;
	SEL sel = NSSelectorFromString(selectorString);
	if ([delegate respondsToSelector: sel])
		[delegate performSelector: sel
                                withObject: parser
                                withObject: attributes];
	else if ([self respondsToSelector: sel])
		[self performSelector: sel
			   withObject: parser
			   withObject: attributes];
	else
	{
#ifdef DEBUG
		NSLog(@"Encountered %@ in %@ qualified as %@ for element %p",
		      elementName, namespaceURI, qName, _currentElement);
#endif
                QFSMElement *element = [[QFSMElement alloc]
                                        initWithAttributes: attributes];
                element.name = elementName;
                if (!(element.parent = self.currentElement) && !self.rootElement)
                    self.rootElement = element;

                [self.currentElement.subElements addObject: element];

                self.currentElement = element;
                
		[self saveContext];
	}
}


- (void) parser: (NSXMLParser *) parser
  didEndElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName
{
	NSString *selectorString = [NSString stringWithFormat: @"end%@:attributes:",
				    [elementName capitalizedMixedCaseString]];
        id delegate = _delegate;
	SEL sel = NSSelectorFromString(selectorString);
	if ([delegate respondsToSelector: sel])
		[delegate performSelector: sel
                                withObject: parser
                                withObject: qName];
	else if ([self respondsToSelector: sel])
		[self performSelector: sel
			   withObject: parser
			   withObject: qName];
	else
	{
#ifdef DEBUG
		NSLog(@"Encountered /%@ in %@ qualified as %@ for element %p",
                      elementName, namespaceURI, qName, _currentElement);
#endif
		if (self.currentElement)
		{
			NSString *parsedData = [self.currentParsedCharacterData copy];
			[self.currentElement.attributes setValue: parsedData
                                                          forKey: elementName];
			[self restoreContext];

                        QFSMElement *parent = self.currentElement.parent;
                        if (parent)
                                self.currentElement = parent;
		}
	}
}


- (void) parser: (NSXMLParser *) parser foundCharacters: (NSString *) string
{
	if (self.accumulatingParsedCharacterData)
		[_currentParsedCharacterData appendString: string];
}


- (void) parser: (NSXMLParser *) p parseErrorOccurred: (NSError *) parseError
{
	[self handleXMLError: parseError];
}


- (void) parserDidEndDocument: (NSXMLParser *) parser
{
	SEL sel = @selector(parsingFinished:);
        id delegate = _delegate;

	if ([delegate respondsToSelector: sel])
		[delegate performSelector: sel withObject: self];
	if ([self respondsToSelector: sel])
		[self performSelector: sel withObject: self];
}

#pragma mark error handling

- (void) handleError: (NSError *) error inDomain: (NSString *) errorDomain
{
	NSString *errorMessage = [error localizedDescription];
#if TARGET_OS_IPHONE
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: errorDomain
							    message: errorMessage
							   delegate: nil
						  cancelButtonTitle: @"OK"
						  otherButtonTitles: nil];
	[alertView show];
	[alertView release];
#else
	NSLog(@"%@: %@", errorDomain, errorMessage);
#endif
}


- (void) handleXMLError: (NSError *) error
{
	[self handleError: error inDomain: @"XML Parsing Error"];
}

#pragma mark Stack methods

- (void) saveContext
{
	[[_stack push: [NSNumber numberWithBool:
		       self.accumulatingParsedCharacterData]]
	 push: [self.currentParsedCharacterData copy]];
	
	self.accumulatingParsedCharacterData = YES;
	[self.currentParsedCharacterData setString: @""];
}


- (void) restoreContext
{
	NSString *s = self.currentParsedCharacterData;
	NSString *t = [_stack pop];
	
	if (t) [self.currentParsedCharacterData setString:
		[t stringByAppendingString: s]];
	
	self.accumulatingParsedCharacterData = [[_stack pop] boolValue];
}


@end

#pragma clang diagnostic pop
