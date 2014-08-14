//
//  main.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-macros"

#ifndef _POSIX_SOURCE
#define _POSIX_SOURCE 200112L
#endif
#ifndef _XOPEN_SOURCE
#define _XOPEN_SOURCE
#endif
#ifdef __APPLE__
#ifndef _DARWIN_C_SOURCE
#define _DARWIN_C_SOURCE 200112L
#ifndef __DARWIN_C_LEVEL
#define __DARWIN_C_LEVEL 200112L
#endif
#endif
#endif

#import <Foundation/Foundation.h>
#import <unistd.h>
#import <stdbool.h>
#import <stdlib.h>
#import "QFSMExporter.h"

static inline void usage(const char *cmd)
{
    fprintf(stderr, "Usage: %s [-v] {qfsm_files}\n", cmd);
}


int main (int argc, char *argv[])
{
    int ch;
    bool verbose = false;
    while ((ch = getopt(argc, argv, "v")) != -1)
    {
        switch (ch)
        {
            case 'v':
                verbose = true;
                break;
            case '?':
            default:
                usage(argv[0]);
                exit(EXIT_FAILURE);
        }
    }
    argc -= optind;
    argv += optind;

    @autoreleasepool
    {
        NSUInteger count = 0;
        
        for (NSString *arg in [[NSProcessInfo processInfo] arguments])
        {
            if (count++ < (NSUInteger)optind) continue;      // skip argv[0] and args
            
            QFSMExporter *exporter = [[QFSMExporter alloc]
                                      initWithContentsOfFile: arg];
            if (verbose) printf("%s ... ", arg.UTF8String);
            [exporter export];
            if (verbose) puts("done.");
        }
        
    }
    
    return EXIT_SUCCESS;
}

#pragma clang diagnostic pop
