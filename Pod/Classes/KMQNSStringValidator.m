//
//  KMQNSStringValidator.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQNSStringValidator.h"

@implementation KMQNSStringValidator

#pragma mark -
#pragma mark - init

+ (id<KMQValidator>)validator {
    return [[KMQNSStringValidator alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.allowNull = NO;
        self.allowEmpty = NO;
        self.trimBeforeValidation = YES;
        self.minLength = 0;
        self.maxLength = NSUIntegerMax;
    }
    return self;
}

#pragma mark -
#pragma mark - Presets

+ (id <KMQValidator>)lengthBetweenMin:(NSUInteger)min max:(NSUInteger)max {
    NSAssert(max >= min, @"max must be greater or equal to min.");
    KMQNSStringValidator *validator = [[KMQNSStringValidator alloc] init];
    validator.minLength = min;
    validator.maxLength = max;
    return validator;
}

+ (id <KMQValidator>)regex:(NSRegularExpression *)regex {
    KMQNSStringValidator *validator = [[KMQNSStringValidator alloc] init];
    validator.regularExpression = regex;
    return validator;
}

#pragma mark -
#pragma mark - Main method

- (BOOL)isValid:(id)object errors:(NSArray *__autoreleasing *)errors {
    NSAssert(object == nil || [object isKindOfClass:[NSString class]], @"This validator can only deal with NSString");
    NSString *string = object;
    NSMutableArray *localErrors = [NSMutableArray array];
    NSMutableDictionary *userInfo = [@{@"string": string == nil ? [NSNull null] : string} mutableCopy];
    
    if (self.trimBeforeValidation) {
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    if (![self passNullTest:string]) {
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringIsNull userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passEmptyTest:string]) {
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringIsEmpty userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passMinLengthTest:string]) {
        [userInfo setObject:@(self.minLength) forKey:KMQValidationStringMinLengthKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringTooShort userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passMaxLengthTest:string]) {
        [userInfo setObject:@(self.maxLength) forKey:KMQValidationStringMaxLengthKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringTooLong userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passDisallowedCharacterSetTest:string]) {
        [userInfo setObject:self.disallowedCharacterSet forKey:KMQValidationStringDisallowedCharsetKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringContainsDisallowedCharset userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passDisallowedSubstringTest:string]) {
        [userInfo setObject:self.disallowedSubStrings forKey:KMQValidationStringDisallowedSubStringKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringContainsDisallowedSubstring userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passRegularExpressionTest:string]) {
        [userInfo setObject:self.regularExpression forKey:KMQValidationStringRegexKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorStringRegexMismatch userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    return YES;
}

#pragma mark -
#pragma mark - Tests

- (BOOL)passNullTest:(NSString *)string {
    return self.allowNull || string != nil;
}

- (BOOL)passEmptyTest:(NSString *)string {
    return self.allowEmpty || [string length] > 0;
}

- (BOOL)passMinLengthTest:(NSString *)string {
    return [string length] >= self.minLength;
}

- (BOOL)passMaxLengthTest:(NSString *)string {
    return [string length] <= self.maxLength;
}

- (BOOL)passDisallowedCharacterSetTest:(NSString *)string {
    return self.disallowedCharacterSet == nil || [string rangeOfCharacterFromSet:self.disallowedCharacterSet].location == NSNotFound;
}

- (BOOL)passDisallowedSubstringTest:(NSString *)string {
    for (NSString *disallowedSubString in self.disallowedSubStrings) {
        if ([string rangeOfString:disallowedSubString].location != NSNotFound)
            return NO;
    }
    return YES;
}

- (BOOL)passRegularExpressionTest:(NSString *)string {
    return self.regularExpression == nil ||
            [self.regularExpression rangeOfFirstMatchInString:string
                                                      options:0
                                                        range:NSMakeRange(0, [string length])].location != NSNotFound;
}

@end
