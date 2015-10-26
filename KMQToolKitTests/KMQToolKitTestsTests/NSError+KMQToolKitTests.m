//
//  NSError+KMQToolKitTests.m
//  KMQToolKitTests
//
//  Created by Weinan Qiu on 2015-10-24.
//  Copyright © 2015 Kumiq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KMQToolKit/KMQToolKit.h>
#import "NSError+KMQErrorCode.h"
#import "NSError+KMQErrorDomain.h"

@interface NSError_KMQToolKitTests : XCTestCase

@end

@implementation NSError_KMQToolKitTests

- (void)setUp {
    [super setUp];
    
    [NSError setupToolKitWithDefaultErrorDomain:@"BlocQuery"
                                     errorPList:[NSBundle plistPathForResource:@"errors" inBundleOfClass:[self class]]
                                defaultErrorKey:@"recovery"
                           fallbackErrorMessage:nil];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testResolveError {
    NSError *error = [NSError errorForCode:kBlocQueryErrorEmailValidationFailed];
    XCTAssertEqualObjects(KMQBlocQueryErrorDomain, error.domain);
    XCTAssertEqual(kBlocQueryErrorEmailValidationFailed, error.code);
    XCTAssertEqualObjects(@"Please provide a valid email address.", error.userInfo[@"recovery"]);
    XCTAssertEqualObjects(@"Email does not pass regular expression test.", error.userInfo[@"reason"]);
    XCTAssertEqualObjects(@"Email validation failed.", error.userInfo[@"description"]);
}

- (void)testResolveErrorMessage {
    XCTAssertEqualObjects(@"Please provide a valid email address.",
                          [NSError messageForCode:kBlocQueryErrorEmailValidationFailed]);
}

- (void)testResolveErrorWithDomainAndContext {
    XCTAssertEqualObjects(@"Oops! We did not find your account. Please make sure email and password are correct.",
                          [NSError messageForDomain:KMQParseErrorDomain code:101 context:@"login"]);
}

- (void)testResolveErrorWithParameter {
    NSError *error = [NSError errorForCode:kBlocQueryErrorTextInsufficientLength
                                   context:nil
                                parameters:@{@"count": @(5)}];
    XCTAssertEqualObjects(@"Please provide a question of at least 5 characters.", [error defaultErrorMessage]);
}

- (void)testResolveErrorFromError {
    NSError *originalError = [NSError errorWithDomain:KMQParseErrorDomain code:200 userInfo:nil];
    NSError *error = [NSError errorFromError:originalError];
    XCTAssertEqualObjects(@"Please provide a username.", [error defaultErrorMessage]);
}

@end
