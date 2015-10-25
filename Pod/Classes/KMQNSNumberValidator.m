//
//  KMQNSNumberValidator.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQNSNumberValidator.h"

@implementation KMQNSNumberValidator

+ (id<KMQValidator>)validator {
    return [[KMQNSNumberValidator alloc] init];
}

+ (id <KMQValidator>) valueBetweenMin:(NSNumber *)min max:(NSNumber *)max {
    KMQNSNumberValidator *validator = [[KMQNSNumberValidator alloc] init];
    validator.min = min;
    validator.max = max;
    return validator;
}

- (BOOL)isValid:(id)object errors:(NSArray *__autoreleasing *)errors {
    NSAssert(object == nil || [object isKindOfClass:[NSNumber class]], @"This validator can only deal with NSNumber");
    NSNumber *number = object;
    NSMutableArray *localErrors = [NSMutableArray array];
    NSMutableDictionary *userInfo = [@{@"number": number == nil ? [NSNull null] : number} mutableCopy];
    
    if (![self passMinTest:number]) {
        [userInfo setObject:self.min forKey:KMQValidationNumberMinKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorNumberToSmall userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    if (![self passMaxTest:number]) {
        [userInfo setObject:self.min forKey:KMQValidationNumberMaxKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorNumberToBig userInfo:userInfo]];
        *errors = localErrors;
        return NO;
    }
    
    return YES;
}

- (BOOL)passMinTest:(NSNumber *)number {
    return self.min == nil || [self.min compare:number] == NSOrderedSame || [self.min compare:number] == NSOrderedAscending;
}

- (BOOL)passMaxTest:(NSNumber *)number {
    return self.max == nil || [self.max compare:number] == NSOrderedSame || [self.max compare:number] == NSOrderedDescending;
}

@end
