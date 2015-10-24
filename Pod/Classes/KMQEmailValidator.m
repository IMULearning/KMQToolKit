//
//  KMQEmailValidator.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQEmailValidator.h"

@implementation KMQEmailValidator

+ (id<KMQValidator>)validator {
    return [[KMQEmailValidator alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.regularExpression = [NSRegularExpression regularExpressionWithPattern:KMQValidationEmailRegex
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    }
    return self;
}

@end
