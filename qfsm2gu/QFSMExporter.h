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

@interface QFSMExporter: NSObject
{
        NSString *inputFileName;
        NSString *outputAFile;
        NSString *outputTFile;

        NSMutableArray *transitions;
        NSMutableArray *states;
        NSString *initialStateID;
        NSUInteger initialStateIndex;

        QFSMParser *parser;
}

@property (copy) NSString *inputFileName;
@property (copy) NSString *outputAFile;
@property (copy) NSString *outputTFile;

- initWithContentsOfFile: (NSString *) fileName;
- export;

@end

#pragma clang diagnostic pop
