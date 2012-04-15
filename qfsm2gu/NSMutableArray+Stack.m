//
//  NSMutableArray+Stack.m
//  GUWhiteboardViewer
//
//  Created by Rene Hexel on 19/03/10.
//  Copyright 2010 Rene Hexel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"


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
		id object = [[self lastObject] retain];
		[self removeLastObject];
		return [object autorelease];
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
