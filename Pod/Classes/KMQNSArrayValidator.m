//
//  KMQNSArrayValidator.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQNSArrayValidator.h"

@implementation KMQNSArrayValidator

+ (id<KMQValidator>)validator {
    return [[KMQNSArrayValidator alloc] init];
}

+ (id <KMQValidator>)arrayContainsElements:(NSArray * _Nonnull)mandatoryElements {
    KMQNSArrayValidator *validator = [[KMQNSArrayValidator alloc] init];
    validator.mandatoryElements = mandatoryElements;
    return validator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.allowNull = NO;
        self.minSize = 0;
        self.maxSize = NSUIntegerMax;
    }
    return self;
}

- (BOOL)isValid:(id)object errors:(NSArray *__autoreleasing *)errors {
    NSAssert([object isKindOfClass:[NSArray class]], @"This validator can only deal with NSArray");
    NSArray *array = object;
    NSMutableArray *localErrors = [NSMutableArray array];
    NSMutableDictionary *userInfo = [@{@"array": array} mutableCopy];
    
    if (![self passNullTest:array]) {
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorArrayIsNull userInfo:userInfo]];
        return NO;
    }
    
    if (![self passMinSizeTest:array]) {
        [userInfo setObject:@(self.minSize) forKey:KMQValidationArrayMinSizeKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorArrayTooSmall userInfo:userInfo]];
        return NO;
    }
    
    if (![self passMaxSizeTest:array]) {
        [userInfo setObject:@(self.maxSize) forKey:KMQValidationArrayMaxSizeKey];
        [localErrors addObject:[NSError errorWithDomain:KMQValidationErrorDomain code:kKMQValidationErrorArrayTooBig userInfo:userInfo]];
        return NO;
    }
    
    return YES;
}

#pragma mark -
#pragma mark - Tests

- (BOOL)passNullTest:(NSArray *)array {
    return self.allowNull || array != nil;
}

- (BOOL)passMinSizeTest:(NSArray *)array {
    return array.count >= self.minSize;
}

- (BOOL)passMaxSizeTest:(NSArray *)array {
    return array.count <= self.maxSize;
}

- (BOOL)passMandatoryElementTest:(NSArray *)array {
    for (id obj in array) {
        if (![array containsObject:obj])
            return NO;
    }
    return YES;
}

- (BOOL)passDisallowedElementTest:(NSArray *)array {
    for (id obj in array) {
        if ([array containsObject:obj])
            return NO;
    }
    return YES;
}

@end
