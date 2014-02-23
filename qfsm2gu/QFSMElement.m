//
//  MyClass.m
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//

#import "QFSMElement.h"


@implementation QFSMElement

@synthesize parent;
@synthesize name;
@synthesize subElements;
@synthesize attributes;

- (instancetype) initWithAttributes: (NSDictionary *) attr
{
        if (!(self = [super init]))
                return nil;

        self.subElements = [NSMutableArray arrayWithCapacity: 256];
        attributes = [attr mutableCopy];

        return self;
}


- (void) dealloc
{
        [self.subElements release];
        [self.attributes release];
        [self.name release];

        [super dealloc];
}


- (id) content
{
        return [self.attributes valueForKey: self.name];
}


- (QFSMElement *) subElementNamed: (NSString *) subName
{
        for (QFSMElement *element in self.subElements)
        {
                if ([element.name isEqualToString: subName])
                        return element;
        }

        return nil;
}

@end
