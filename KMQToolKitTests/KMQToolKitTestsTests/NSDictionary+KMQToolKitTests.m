//
//  NSDictionary+KMQToolKitTests.m
//  KMQToolKitTests
//
//  Created by Weinan Qiu on 2015-10-25.
//  Copyright © 2015 Kumiq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <NSDictionary+KMQToolKit.h>

@interface NSDictionary_KMQToolKitTests : XCTestCase

@end

@implementation NSDictionary_KMQToolKitTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTransitiveKey {
    NSDictionary *dictionary = @{
                                 @"a" : @{
                                         @"b": @"1",
                                         @"c": @{
                                                 @"d" : @"2"
                                                 },
                                         @"f": @(1)
                                         },
                                 @"e": @"3"
                                 };
    XCTAssertEqualObjects(@"1", [dictionary objectForTransitiveKey:@"a.b" delimiter:@"."]);
    XCTAssertEqualObjects(@"2", [dictionary objectForTransitiveKey:@"a->c->d" delimiter:@"->"]);
    XCTAssertEqualObjects(@(1), [dictionary objectForTransitiveKey:@"a:f" delimiter:@":"]);
    XCTAssertEqualObjects(@"3", [dictionary objectForTransitiveKey:@"e"]);
}

@end
