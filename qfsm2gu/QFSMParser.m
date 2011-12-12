//
//  QFSMParser.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//
#import "QFSMParser.h"
#import "QFSMElement.h"
#import "NSString+MixedCase.h"
#import "NSMutableArray+Stack.h"

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


- (void) dealloc
{
        [_currentParsedCharacterData release];
        [_currentElement release];
        [_error release];
        [_parser release];
        [_stack release];

        [super dealloc];
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
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
#ifdef DEBUG
	NSLog(@"received: '%@'", [[[NSString alloc] initWithData: data
							encoding: NSUTF8StringEncoding]
				  autorelease]);
#endif
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData: data];
	[parser setDelegate: self];
	[parser setShouldProcessNamespaces: YES];

        [self setParser: parser];
        [self parse];

	[parser release];
	[pool release];
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
	SEL sel = NSSelectorFromString(selectorString);
	if ([_delegate respondsToSelector: sel])
		[_delegate performSelector: sel
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
                element.parent = self.currentElement;
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
	SEL sel = NSSelectorFromString(selectorString);
	if ([_delegate respondsToSelector: sel])
		[_delegate performSelector: sel
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
			[parsedData release];

                        if (self.currentElement.parent)
                                self.currentElement = self.currentElement.parent;
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
        
	if ([_delegate respondsToSelector: sel])
		[_delegate performSelector: sel withObject: self];		
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
	 push: [[self.currentParsedCharacterData copy] autorelease]];
	
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
