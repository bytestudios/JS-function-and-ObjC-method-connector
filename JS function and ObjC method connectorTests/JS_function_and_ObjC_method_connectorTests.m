//
//  JS_function_and_ObjC_method_connectorTests.m
//  JS function and ObjC method connectorTests
//
//  Created by Michael Diedrick on 5/26/15.
//  Copyright (c) 2015 Michael Diedrick. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

@interface JS_function_and_ObjC_method_connectorTests : XCTestCase

@end

@implementation JS_function_and_ObjC_method_connectorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
