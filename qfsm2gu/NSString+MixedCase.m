//
//  NSString+MixedCase.m
//  GUWhiteboardViewer
//
//  Created by Rene Hexel on 19/03/10.
//  Copyright 2010 Rene Hexel. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NSString+MixedCase.h"


@implementation NSString (MixedCaseAdditions)

- (NSString *) mixedCaseString
{
	@try
	{
		return [[[self substringToIndex: 1] lowercaseString]
			stringByAppendingString: [self substringFromIndex: 1]];

	}
	@catch (NSException * e)
	{
	}

	return self;
}


- (NSString *) capitalizedMixedCaseString
{
	@try
	{
		return [[[self substringToIndex: 1] uppercaseString]
			stringByAppendingString: [self substringFromIndex: 1]];
		
	}
	@catch (NSException * e)
	{
	}
	
	return self;
}


- (NSString *) trimmedString
{
        return [self stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


#ifndef GNUSTEP
- (NSString *) stringByReplacingOccurrencesOfCharactersInSet: (NSCharacterSet *) s
                                                  withString: (NSString *) replacement
{
        NSString *output = self;
        NSRange range = [output rangeOfCharacterFromSet: s];
        while (range.location != NSNotFound)
        {
                output = [output stringByReplacingCharactersInRange: range
                                                         withString: replacement];
                range = [output rangeOfCharacterFromSet: s];
        }

        return output;
}


- (NSString *) trimmedSingleLineString
{
        NSMutableCharacterSet *cs = [[[NSCharacterSet newlineCharacterSet]
                                      mutableCopy] autorelease];
        [cs formUnionWithCharacterSet: [NSCharacterSet
                                        characterSetWithCharactersInString:
                                        @"\t"]];
        return [[self trimmedString]
                stringByReplacingOccurrencesOfCharactersInSet: cs
                withString: @" "];
}
#else
- (NSString *) trimmedSingleLineString
{
        return [[[[self trimmedString] stringByReplacingString: @"\n"
						    withString: @" "]
		stringByReplacingString: @"\t" withString: @" "]
		stringByReplacingString: @"\r" withString: @" "];
}
#endif

@end
