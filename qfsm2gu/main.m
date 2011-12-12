//
//  main.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "QFSMExporter.h"

int main (int argc, const char *argv[])
{
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        NSUInteger count = 0;

        for (NSString *arg in [[NSProcessInfo processInfo] arguments])
        {
                if (!count++) continue;         // skip argv[0]

                NSAutoreleasePool *innerpool = [[NSAutoreleasePool alloc] init];
                QFSMExporter *exporter = [[QFSMExporter alloc]
                                          initWithContentsOfFile: arg];
                [exporter export];
                [exporter release];
                [innerpool drain];
        }

        [pool drain];

        return EXIT_SUCCESS;
}

