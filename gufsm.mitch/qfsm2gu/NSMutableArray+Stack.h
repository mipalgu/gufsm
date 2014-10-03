//
//  NSMutableArray+Stack.h
//  GUWhiteboardViewer
//
//  Created by Rene Hexel on 19/03/10.
//  Copyright 2010-2014 Rene Hexel. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmissing-method-return-type"

@interface NSMutableArray (StackAdditions)

- push: object;
- pop;
- peek;

@end

#pragma clang diagnostic pop
