//
//  KMQValidatorTests.m
//  KMQToolKitTests
//
//  Created by Weinan Qiu on 2015-10-25.
//  Copyright © 2015 Kumiq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KMQToolKit/KMQToolKit.h>
#import <KMQEmailValidator.h>
#import <KMQNSStringValidator.h>

@interface KMQValidatorTests : XCTestCase

@end

@implementation KMQValidatorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark -
#pragma mark - String validation

- (void)testStringValidatorNonNull {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:nil errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringIsNull), @(errors[0].code));
}

- (void)testStringValidatorNonEmpty {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.trimBeforeValidation = YES;
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@" " errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringIsEmpty), @(errors[0].code));
}

- (void)testStringValidatorTooShort {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.minLength = 5;
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@"abcd" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringTooShort), @(errors[0].code));
}

- (void)testStringValidatorTooLong {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.maxLength = 5;
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@"abcdef" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringTooLong), @(errors[0].code));
}

- (void)testStringValidatorDisallowedCharacterSet {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.disallowedCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"abc"];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@"adef" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringContainsDisallowedCharset), @(errors[0].code));
}

- (void)testStringValidatorDisallowedSubstring {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.disallowedSubStrings = @[@"hello", @"world"];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@"hello anderson" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringContainsDisallowedSubstring), @(errors[0].code));
}

- (void)testStringValidatorRegex {
    KMQNSStringValidator *stringValidator = [KMQNSStringValidator validator];
    stringValidator.regularExpression = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:0 error:nil];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([stringValidator isValid:@"012345abc" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringRegexMismatch), @(errors[0].code));
}

#pragma mark -
#pragma mark - Email validation

- (void)testEmailValidatorValid {
    KMQEmailValidator *emailValidator = [KMQEmailValidator validator];
    XCTAssertTrue([emailValidator isValid:@"bar@foo.com" errors:nil]);
}

- (void)testEmailValidatorInvalid {
    KMQEmailValidator *emailValidator = [KMQEmailValidator validator];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([emailValidator isValid:@"abc" errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorStringRegexMismatch), @(errors[0].code));
}

#pragma mark -
#pragma mark - Number validation

- (void)testNumberValidationIntegerTooSmall {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5) max:@(10)];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([numberValidator isValid:@(3) errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorNumberToSmall), @(errors[0].code));
}

- (void)testNumberValidationIntegerTooBig {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5) max:@(10)];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([numberValidator isValid:@(11) errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorNumberToBig), @(errors[0].code));
}

- (void)testNumberValidationIntegerInRange {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5) max:@(10)];
    XCTAssertTrue([numberValidator isValid:@(5) errors:nil]);
    XCTAssertTrue([numberValidator isValid:@(7) errors:nil]);
    XCTAssertTrue([numberValidator isValid:@(10) errors:nil]);
}

- (void)testNumberValidationFloatInRange {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5.0f) max:@(10.0f)];
    XCTAssertTrue([numberValidator isValid:@(5.0f) errors:nil]);
    XCTAssertTrue([numberValidator isValid:@(7.0f) errors:nil]);
    XCTAssertTrue([numberValidator isValid:@(10.0f) errors:nil]);
}

- (void)testNumberValidationFloatTooSmall {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5.0f) max:@(10.0f)];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([numberValidator isValid:@(3.0f) errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorNumberToSmall), @(errors[0].code));
}

- (void)testNumberValidationFloatTooBig {
    KMQNSNumberValidator *numberValidator = [KMQNSNumberValidator valueBetweenMin:@(5.0f) max:@(10.0f)];
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([numberValidator isValid:@(11.0f) errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorNumberToBig), @(errors[0].code));
}

#pragma mark -
#pragma mark - Array

- (void)testArrayValidationIsNull {
    KMQNSArrayValidator *arrayValidator = [KMQNSArrayValidator validator];
    arrayValidator.allowNull = NO;
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([arrayValidator isValid:nil errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorArrayIsNull), @(errors[0].code));
}

- (void)testArrayValidationTooShort {
    KMQNSArrayValidator *arrayValidator = [KMQNSArrayValidator validator];
    arrayValidator.minSize = 3;
    NSArray<NSError *> *errors = nil;
    NSArray *object = @[@"1", @"2"];
    
    XCTAssertFalse([arrayValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorArrayTooSmall), @(errors[0].code));
}

- (void)testArrayValidationTooBig {
    KMQNSArrayValidator *arrayValidator = [KMQNSArrayValidator validator];
    arrayValidator.maxSize = 3;
    NSArray<NSError *> *errors = nil;
    NSArray *object = @[@"1", @"2", @"3", @"4"];
    
    XCTAssertFalse([arrayValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorArrayTooBig), @(errors[0].code));
}

- (void)testArrayValidationDisallowedElements {
    KMQNSArrayValidator *arrayValidator = [KMQNSArrayValidator validator];
    arrayValidator.disallowedElements = @[@"1", @"2"];
    NSArray<NSError *> *errors = nil;
    NSArray *object = @[@"2", @"3", @"4"];
    
    XCTAssertFalse([arrayValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorArrayContainsDisallowedKey), @(errors[0].code));
}

- (void)testArrayValidationMandatoryElements {
    KMQNSArrayValidator *arrayValidator = [KMQNSArrayValidator validator];
    arrayValidator.mandatoryElements = @[@"1"];
    NSArray<NSError *> *errors = nil;
    NSArray *object = @[@"2", @"3", @"4"];
    
    XCTAssertFalse([arrayValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorArrayMissingMandatoryElement), @(errors[0].code));
}

#pragma mark -
#pragma mark - Dictionary

- (void)testDictionaryValidationIsNull {
    KMQNSDictionaryValidator *dictionaryValidator = [KMQNSDictionaryValidator validator];
    dictionaryValidator.allowNull = NO;
    NSArray<NSError *> *errors = nil;
    
    XCTAssertFalse([dictionaryValidator isValid:nil errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorDictionaryIsNull), @(errors[0].code));
}

- (void)testDictionaryValidationTooShort {
    KMQNSDictionaryValidator *dictionaryValidator = [KMQNSDictionaryValidator validator];
    dictionaryValidator.minSize = 3;
    NSArray<NSError *> *errors = nil;
    NSDictionary *object = @{@"1": @"one"};
    
    XCTAssertFalse([dictionaryValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorDictionaryTooSmall), @(errors[0].code));
}

- (void)testDictionaryValidationTooBig {
    KMQNSDictionaryValidator *dictionaryValidator = [KMQNSDictionaryValidator validator];
    dictionaryValidator.maxSize = 1;
    NSArray<NSError *> *errors = nil;
    NSDictionary *object = @{@"1": @"one", @"2": @"two"};
    
    XCTAssertFalse([dictionaryValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorDictionaryTooBig), @(errors[0].code));
}

- (void)testDictionaryValidationDisallowedKeys {
    KMQNSDictionaryValidator *dictionaryValidator = [KMQNSDictionaryValidator validator];
    dictionaryValidator.disallowedKeys = @[@"1"];
    NSArray<NSError *> *errors = nil;
    NSDictionary *object = @{@"1": @"one", @"2": @"two"};
    
    XCTAssertFalse([dictionaryValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorDictionaryContainsDisallowedKey), @(errors[0].code));
}

- (void)testDictionaryValidationMandatoryKeys {
    KMQNSDictionaryValidator *dictionaryValidator = [KMQNSDictionaryValidator validator];
    dictionaryValidator.mandatoryKeys = @[@"3"];
    NSArray<NSError *> *errors = nil;
    NSDictionary *object = @{@"1": @"one", @"2": @"two"};
    
    XCTAssertFalse([dictionaryValidator isValid:object errors:&errors]);
    XCTAssertEqualObjects(@1, @(errors.count));
    XCTAssertEqualObjects(KMQValidationErrorDomain, errors[0].domain);
    XCTAssertEqualObjects(@(kKMQValidationErrorDictionaryMissingMandatoryKey), @(errors[0].code));
}

@end
