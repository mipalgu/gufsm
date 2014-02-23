//
//  QFSMParser.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QFSMElement;

#ifdef OLD_GNUSTEP_BASE_VERSION
@protocol NSXMLParserDelegate <NSObject>
@optional
- (void) parserDidStartDocument: (NSXMLParser *) parser;
- (void) parserDidEndDocument: (NSXMLParser *) parser;
@end
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
#pragma clang diagnostic ignored "-Wmissing-method-return-type"
#pragma clang diagnostic ignored "-Wimplicit-atomic-properties"

@interface QFSMParser: NSObject <NSXMLParserDelegate>
{
@private
        id                       _delegate;

	NSMutableArray          *_stack;
        NSMutableString         *_currentParsedCharacterData;
        QFSMElement             *_currentElement;    // context specific

        NSXMLParser             *_parser;
        NSError                 *_error;

	BOOL isAccumulatingParsedCharacterData;
}

@property (assign) id delegate;
@property (retain) NSXMLParser *parser;
@property (retain) NSMutableString *currentParsedCharacterData;
@property (retain) QFSMElement *currentElement;
@property (retain) NSMutableArray *stack;
@property (retain) NSError *error;
@property (nonatomic, assign) BOOL accumulatingParsedCharacterData;

- initWithContentsOfURL: (NSURL *) url;

- (void) parse;
- (void) parseXMLData: (NSData *) data;

- (void) handleXMLError: (NSError *) error;

- (void) saveContext;
- (void) restoreContext;


@end

#pragma clang diagnostic pop
