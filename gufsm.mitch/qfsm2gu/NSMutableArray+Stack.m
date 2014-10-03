//
//  NSMutableArray+Stack.m
//  GUWhiteboardViewer
//
//  Created by Rene Hexel on 19/03/10.
//  Copyright 2010, 2014 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmissing-method-return-type"

@implementation NSMutableArray (StackAdditions)

- push: object
{
	[self addObject: object];
	return self;
}

- pop
{
	@try
	{
		id object = [self lastObject];
		[self removeLastObject];
		return object;
	}
	@catch (NSException *)
	{
	}

	return nil;
}


- peek
{
	@try
	{
		return [self lastObject];
	}
	@catch (NSException *)
	{
	}

	return nil;
}

@end

#pragma clang diagnostic pop
