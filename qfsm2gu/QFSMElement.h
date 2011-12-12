//
//  MyClass.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QFSMElement: NSObject
{
        QFSMElement             *parent;
        
        NSString                *name;
        NSMutableArray          *subElements;
        NSMutableDictionary     *attributes;
}

@property (assign) QFSMElement *parent;
@property (copy) NSString *name;
@property (retain) NSMutableArray *subElements;
@property (retain) NSMutableDictionary *attributes;

- initWithAttributes: (NSDictionary *) attr;
- content;
- (QFSMElement *) subElementNamed: (NSString *) subName;

@end
