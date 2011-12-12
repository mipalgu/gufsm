//
//  MyClass.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//

#import "QFSMElement.h"


@implementation QFSMElement

@synthesize parent;
@synthesize name;
@synthesize subElements;
@synthesize attributes;

- initWithAttributes: (NSDictionary *) attr
{
        if (!(self = [super init]))
                return nil;

        self.subElements = [NSMutableArray arrayWithCapacity: 256];
        attributes = [attr mutableCopy];

        return self;
}


- (void) dealloc
{
        [subElements release];
        [attributes release];
        [name release];

        [super dealloc];
}


- content
{
        return [attributes valueForKey: name];
}


- (QFSMElement *) subElementNamed: (NSString *) subName
{
        for (QFSMElement *element in subElements)
        {
                if ([element.name isEqualToString: subName])
                        return element;
        }

        return nil;
}

@end
