//
//  NSString+MixedCase.h
//  GUWhiteboardViewer
//
//  Created by Rene Hexel on 19/03/10.
//  Copyright 2010-2011 Rene Hexel. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (MixedCaseAdditions)

- (NSString *) mixedCaseString;
- (NSString *) capitalizedMixedCaseString;

- (NSString *) trimmedString;
- (NSString *) trimmedSingleLineString;
#ifndef GNUSTEP
- (NSString *) stringByReplacingOccurrencesOfCharactersInSet: (NSCharacterSet *) s
                                                  withString: (NSString *) replacement;
#endif // GNUSTEP

@end
