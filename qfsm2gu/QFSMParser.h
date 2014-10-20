//
//  QFSMParser.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011, 2014 Rene Hexel. All rights reserved.
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
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma clang diagnostic ignored "-Wreceiver-is-weak"
#pragma clang diagnostic ignored "-Warc-repeated-use-of-weak"

@interface QFSMParser: NSObject <NSXMLParserDelegate>

@property (weak) id delegate;
@property (strong) NSXMLParser *parser;
@property (strong) NSMutableString *currentParsedCharacterData;
@property (strong) QFSMElement *rootElement;
@property (strong) QFSMElement *currentElement;
@property (strong) NSMutableArray *stack;
@property (strong) NSError *error;
@property (nonatomic, getter=isAccumulatingParsedCharacterData) BOOL accumulatingParsedCharacterData;

- initWithContentsOfURL: (NSURL *) url;

- (void) parse;
- (void) parseXMLData: (NSData *) data;

- (void) handleXMLError: (NSError *) error;

- (void) saveContext;
- (void) restoreContext;


@end

#pragma clang diagnostic pop
