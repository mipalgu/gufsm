//
//  libclfsmTests.m
//  libclfsmTests
//
//  Created by Rene Hexel on 5/04/2014.
//  Copyright (c) 2014 Rene Hexel. All rights reserved.
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wauto-import"

#import <SenTestingKit/SenTestingKit.h>

@interface libclfsmTests : SenTestCase

@end

@implementation libclfsmTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    STFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end

#pragma clang diagnostic pop
