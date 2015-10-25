//
//  NSArray+KMQToolKitTests.m
//  KMQToolKitTests
//
//  Created by Weinan Qiu on 2015-10-25.
//  Copyright © 2015 Kumiq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <NSArray+KMQToolKit.h>

@interface NSArray_KMQToolKitTests : XCTestCase

@end

@implementation NSArray_KMQToolKitTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testArrayIntersects {
    NSArray *first = @[@"1", @"2"];
    NSArray *second = @[@"2", @"3"];
    XCTAssertTrue([first intersects:second]);
}

- (void)testArrayDoesNotIntersect {
    NSArray *first = @[@"1", @"2"];
    NSArray *second = @[@"3", @"4"];
    XCTAssertFalse([first intersects:second]);
}

- (void)testArrayIsSubArray {
    NSArray *first = @[@"1", @"2", @"3"];
    NSArray *second = @[@"1", @"2", @"3", @"4"];
    XCTAssertTrue([first isSubArrayOf:second]);
}

- (void)testArrayIsNotSubArray {
    NSArray *first = @[@"1", @"2", @"3"];
    NSArray *second = @[@"1", @"2", @"4"];
    XCTAssertFalse([first isSubArrayOf:second]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
