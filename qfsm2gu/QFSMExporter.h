//
//  QFSMExporter.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QFSMParser;
@class QFSMElement;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
#pragma clang diagnostic ignored "-Wmissing-method-return-type"
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"

@interface QFSMExporter: NSObject

@property (strong) QFSMParser *parser;
@property (copy) NSString *inputFileName;
@property (copy) NSString *outputAFile;
@property (copy) NSString *outputTFile;

@property NSUInteger initialStateIndex;

@property (strong) NSMutableArray *transitions;
@property (strong) NSMutableArray *states;

- initWithContentsOfFile: (NSString *) fileName;
- export;

@end

#pragma clang diagnostic pop
