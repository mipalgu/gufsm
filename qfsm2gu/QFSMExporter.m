//
//  QFSMExporter.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//
#import "syntax_check.h"

#import "QFSMExporter.h"
#import "QFSMParser.h"
#import "QFSMElement.h"
#import "NSString+MixedCase.h"

@interface QFSMKeyValue: NSObject
{
        NSString *key;
        NSString *value;
}
@property (copy) NSString *key;
@property (copy) NSString *value;

+ QFSMValue: (NSString *) v forKey: (NSString *) k;
- (NSUInteger) orderedIndexInArray: (NSArray *) array;
- (NSString *) description;

@end


@implementation QFSMKeyValue
@synthesize key, value;

+ QFSMValue: (NSString *) v forKey: (NSString *) k
{
        QFSMKeyValue *q = [[QFSMKeyValue alloc] init];
        q.key = k;
        q.value = v;
        return [q autorelease];
}


- (NSUInteger) orderedIndexInArray: (NSArray *) array
{
        NSUInteger n = [array count];

        for (NSUInteger i = 0; i < n; i++)
        {
                QFSMKeyValue *element = [array objectAtIndex: i];
                if ([key compare: element.key] == NSOrderedAscending)
                        return i;
        }

        return n;
}


- (NSString *) description
{
        return value ? value : @"";
}


- (void) dealloc
{
        [key release];
        [value release];

        [super dealloc];
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
        self.outputAFile = [NSString stringWithFormat: @"A%@.txt",
                            [inputFileName
                             stringByDeletingPathExtension]];
        self.outputTFile = [NSString stringWithFormat: @"T%@.txt",
                            [inputFileName
                             stringByDeletingPathExtension]];
        parser = [[QFSMParser alloc] initWithContentsOfURL: 
                  [NSURL fileURLWithPath: fileName]];
        parser.delegate = self;

        return self;
}


- (void) dealloc
{
        [parser release];
        [outputTFile release];
        [outputAFile release];
        [inputFileName release];
        [initialStateID release];

        [super dealloc];
}


- (void) exportState: (QFSMElement *) currentElement
{
        NSString *stateID = [[currentElement.attributes objectForKey: @"code"]
                              trimmedSingleLineString];
        NSString *stateName = [currentElement.content
                               trimmedSingleLineString];
        NSString *description = [[currentElement.attributes
                                  objectForKey: @"description"]
                                 trimmedSingleLineString];
        NSMutableString *aString = [NSMutableString stringWithFormat: @"%@\t",
                                    stateID];
        if ([stateName length])
                [aString appendFormat: @"%@|", stateName];
        if ([description length])
                [aString appendString: description];

        if ([stateID isEqualToString: initialStateID])
                initialStateIndex = [states count];

        [states addObject: aString];

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
                                    @"%@\t%@\t%@", from, p, to];

        NSString *orderKey = [NSString stringWithFormat: @"%05u %@ %05u %@ %05u %@",
                              [from intValue], from, [o intValue], o,
                              [to intValue], to];
        QFSMKeyValue *tuple = [QFSMKeyValue QFSMValue: tString
                                               forKey: orderKey];
        NSUInteger index = [tuple orderedIndexInArray: transitions];

        NSUInteger n = [transitions count];
        if ([orderKey length] && index < n)
                [transitions insertObject: tuple
                                  atIndex: index];
        else
                [transitions addObject: tuple];

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
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

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

        [pool drain];

        return self;
}


- export
{
        [parser parse];

        int count = 0;
        for (QFSMElement *machine in parser.currentElement.subElements)
        {
                NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

                states      = [NSMutableArray arrayWithCapacity: 256];
                transitions = [NSMutableArray arrayWithCapacity: 1024];

                self.initialStateID = [machine.attributes objectForKey: @"initialstate"];

                if ([self exportMachine: machine])
                {
                        NSError *error = nil;
                        NSString *initialState = [[states objectAtIndex:
                                                   initialStateIndex] retain];
                        [states removeObjectAtIndex: initialStateIndex];
                        [states addObject: initialState];
                        [initialState release];

                        NSString *content = [[states componentsJoinedByString:@"\n"]
                                             stringByAppendingString: @"\n"];
        
                        if (![content writeToFile: outputAFile
                                       atomically: YES
                                         encoding: NSUTF8StringEncoding
                                            error: &error])
                        {
                                NSLog(@"Error writing '%@': %@", outputAFile,
                                      [error localizedFailureReason]);
                        }

                        content = [[transitions componentsJoinedByString:@"\n"]
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
                [pool drain];
        }

        return self;
}


@end
