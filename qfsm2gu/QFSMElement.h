//
//  MyClass.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFSMElement: NSObject

@property (nonatomic, assign) QFSMElement *parent;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *subElements;
@property (nonatomic, retain) NSMutableDictionary *attributes;

- (instancetype) initWithAttributes: (NSDictionary *) attr;
- (id) content;
- (QFSMElement *) subElementNamed: (NSString *) subName;

@end
