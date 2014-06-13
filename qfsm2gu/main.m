//
//  main.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "QFSMExporter.h"

int main (int argc, const char *argv[])
{
        (void) argc;
        (void) argv;
        @autoreleasepool {
                NSUInteger count = 0;

                for (NSString *arg in [[NSProcessInfo processInfo] arguments])
                {
                        if (!count++) continue;         // skip argv[0]

                        @autoreleasepool {
                                QFSMExporter *exporter = [[QFSMExporter alloc]
                                                          initWithContentsOfFile: arg];
                                [exporter export];
                        }
                }

        }

        return EXIT_SUCCESS;
}

