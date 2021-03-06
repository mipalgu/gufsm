//
//  QFSMExporter.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//
#import "syntax_check.h"

#import "QFSMExporter.h"
#import "QFSMParser.h"
#import "QFSMElement.h"
#import "NSString+MixedCase.h"

#ifdef GNUSTEP_BASE_VERSION
#include "GTMNSString+HTML.h"
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
#pragma clang diagnostic ignored "-Wmissing-method-return-type"
#pragma clang diagnostic ignored "-Wimplicit-atomic-properties"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-messaging-id"


@interface QFSMKeyValue: NSObject

@property (copy) NSString *key;
@property (copy) NSString *value;

+ QFSMValue: (NSString *) v forKey: (NSString *) k;
- (NSUInteger) orderedIndexInArray: (NSArray *) array;
- (NSString *) description;

@end


@implementation QFSMKeyValue

+ QFSMValue: (NSString *) v forKey: (NSString *) k
{
        QFSMKeyValue *q = [[QFSMKeyValue alloc] init];
        q.key = k;
        q.value = v;
        return q;
}


- (NSUInteger) orderedIndexInArray: (NSArray *) array
{
        NSUInteger n = [array count];

        for (NSUInteger i = 0; i < n; i++)
        {
                QFSMKeyValue *element = [array objectAtIndex: i];
                if ([_key compare: element.key] == NSOrderedAscending)
                        return i;
        }

        return n;
}


- (NSString *) description
{
        return _value ? _value : @"";
}



@end


@interface QFSMExporter ()
@property (copy) NSString *initialStateID;
@end


@implementation QFSMExporter

@synthesize inputFileName;
@synthesize outputAFile;
@synthesize outputTFile;
@synthesize initialStateID;

- initWithContentsOfFile: (NSString *) fileName
{
        if (!(self = [super init]))
                return nil;

        self.inputFileName = [fileName lastPathComponent];
        self.outputAFile = [NSString stringWithFormat: @"%@.acsl",
                            [inputFileName
                             stringByDeletingPathExtension]];
        self.outputTFile = [NSString stringWithFormat: @"%@.tcsl",
                            [inputFileName
                             stringByDeletingPathExtension]];
        _parser = [[QFSMParser alloc] initWithContentsOfURL: 
                  [NSURL fileURLWithPath: fileName]];
        _parser.delegate = self;

        return self;
}




- (void) exportState: (QFSMElement *) currentElement
{
        NSString *stateID = [[currentElement.attributes objectForKey: @"code"]
                              trimmedSingleLineString];
        NSString *stateName = [currentElement.content
                               trimmedSingleLineString];
        NSString *description = [[currentElement.attributes
                                  objectForKey: @"description"]
                                 trimmedString];
        NSMutableString *aString = [NSMutableString stringWithFormat: @"%@\t",
                                    stateID];
        if ([stateName length])
                [aString appendFormat: @"%@\n", stateName];
        if ([description length])
        {
#ifdef GNUSTEP_BASE_VERSION
                description = [description gtm_stringByUnescapingFromHTML];
#endif
                description = [description stringByReplacingOccurrencesOfString: @"OnEntry$\n" withString: @"OnEntry "];
                description = [description stringByReplacingOccurrencesOfString: @"$OnExit$\n" withString: @"OnExit "];
                description = [description stringByReplacingOccurrencesOfString: @"$Internal$\n{" withString: @"{"];
                description = [description stringByReplacingOccurrencesOfString: @"$Internal$\n\n" withString: @"{}\n"];
                description = [description stringByReplacingOccurrencesOfString: @"$Internal$\n" withString: @"{}\n"];
                description = [description stringByReplacingOccurrencesOfString: @"$Internal$" withString: @"{}\n"];

                [aString appendFormat: @"%@\n", description];
        }

        if ([stateID isEqualToString: initialStateID])
                _initialStateIndex = [_states count];

        [_states addObject: aString];

        /*
         * parse state and print out any errors
         */
        if (check_action([aString UTF8String], [stateName UTF8String]) < 0)
                fprintf(stderr, "  ^^^ '%s' ^^^\n\n", [inputFileName UTF8String]);
}


- (void) exportTransition: (QFSMElement *) currentElement
{
        QFSMElement *predicate = [currentElement subElementNamed: @"inputs"];
        QFSMElement *fromState = [currentElement subElementNamed: @"from"];
        QFSMElement *toState   = [currentElement subElementNamed: @"to"];
        QFSMElement *order     = [currentElement subElementNamed: @"outputs"];
        NSString *from = [[fromState content] trimmedSingleLineString];
        NSString *to = [[toState content] trimmedSingleLineString];
        NSString *pred = [[predicate content] trimmedSingleLineString];
        NSString *o = [[order content] trimmedSingleLineString];

        NSString *p = pred;
        if (![p length]) p = @"TRUE";

        NSMutableString *tString = [NSMutableString stringWithFormat:
                                    @"%@ %@ %@", from, to, p];

        NSString *orderKey = [NSString stringWithFormat: @"%05u %@ %05u %@ %05u %@",
                              [from intValue], from, [o intValue], o,
                              [to intValue], to];
        QFSMKeyValue *tuple = [QFSMKeyValue QFSMValue: tString
                                               forKey: orderKey];
        NSUInteger index = [tuple orderedIndexInArray: _transitions];

        NSUInteger n = [_transitions count];
        if ([orderKey length] && index < n)
                [_transitions insertObject: tuple
                                  atIndex: index];
        else
                [_transitions addObject: tuple];

        if (![from length])
                fprintf(stderr, "Warning: %s transition %lu has no source state: '%s'\n",
                        [inputFileName UTF8String], (unsigned long) n, [tString UTF8String]);
        if (![to length])
                fprintf(stderr, "Warning: %s transition %lu has no destination state: '%s'\n",
                        [inputFileName UTF8String], (unsigned long) n, [tString UTF8String]);
        if (![pred length])
                fprintf(stdout, "   Note: %s transition %lu has no predicate, assuming TRUE: '%s'\n",
                        [inputFileName UTF8String], (unsigned long) n, [tString UTF8String]);
        /*
         * parse transition and print out any errors
         */
        const char *string = [tString UTF8String];
        if (check_transition(string, string) < 0)
                fprintf(stderr, "  ^^^ '%s' ^^^\n\n", [inputFileName UTF8String]);
}


- exportMachine: (QFSMElement *) machine
{
        @autoreleasepool {

                for (QFSMElement *currentElement in machine.subElements)
                {
                        SEL sel = NSSelectorFromString([NSString stringWithFormat:
                                                        @"export%@:",
                                                       [currentElement.name
                                                        capitalizedMixedCaseString]]);
                        if (sel && [self respondsToSelector: sel])
                                [self performSelector: sel
                                           withObject: currentElement];
#ifdef DEBUG
                        else NSLog(@"Ignoring machine element '%@'", currentElement.name);
#endif
                }


                return self;
        }
}


- export
{
        [_parser parse];

        int count = 0;
        for (QFSMElement *machine in _parser.currentElement.subElements)
        {
                @autoreleasepool {

                        _states      = [NSMutableArray arrayWithCapacity: 256];
                        _transitions = [NSMutableArray arrayWithCapacity: 1024];

                        self.initialStateID = [machine.attributes objectForKey: @"initialstate"];

                        if ([self exportMachine: machine])
                        {
                                NSError *error = nil;
                                NSString *initialState = [_states objectAtIndex:
                                                           _initialStateIndex];
                                [_states removeObjectAtIndex:_initialStateIndex];
                               [ _states insertObject: initialState atIndex: 0];

                                NSString *content = [[_states componentsJoinedByString:@"\n"]
                                                     stringByAppendingString: @"\n"];
        
                                if (![content writeToFile: outputAFile
                                               atomically: YES
                                                 encoding: NSUTF8StringEncoding
                                                    error: &error])
                                {
                                        NSLog(@"Error writing '%@': %@", outputAFile,
                                              [error localizedFailureReason]);
                                }

                                content = [[_transitions componentsJoinedByString:@"\n"]
                                           stringByAppendingString: @"\n"];

                                if (![content writeToFile: outputTFile
                                               atomically: YES
                                                 encoding: NSUTF8StringEncoding
                                                    error: &error])
                                {
                                        NSLog(@"Error writing '%@': %@", outputTFile,
                                              [error localizedFailureReason]);
                                }
                        }

                        count++;
                        self.outputAFile = [NSString stringWithFormat: @"A%@-%d.txt",
                                            [inputFileName stringByDeletingPathExtension],
                                            count];
                        self.outputTFile = [NSString stringWithFormat: @"T%@-%d.txt",
                                            [inputFileName stringByDeletingPathExtension],
                                            count];
                }
        }

        return self;
}


@end


#pragma clang diagnostic pop
