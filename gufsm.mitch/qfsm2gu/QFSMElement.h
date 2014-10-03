//
//  MyClass.h
//  qfsm2gu
//
//  Created by Rene Hexel on 18/03/11.
//  Copyright 2011-2014 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"

@interface QFSMElement: NSObject

@property (nonatomic, weak) QFSMElement *parent;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *subElements;
@property (nonatomic, strong) NSMutableDictionary *attributes;

- (instancetype) initWithAttributes: (NSDictionary *) attr;
- (id) content;
- (QFSMElement *) subElementNamed: (NSString *) subName;

@end

#pragma clang diagnostic pop
