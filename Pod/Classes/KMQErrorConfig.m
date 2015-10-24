//
//  KMQErrorConfig.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-23.
//
//

#import "KMQErrorConfig.h"
#import "GRMustache.h"

NSString *const ErrorNameCodeMapping = @"errorNameCodeMapping";

@interface KMQErrorConfig () {
    NSDictionary *_errors;
}

@end

@implementation KMQErrorConfig

#pragma mark -
#pragma mark - Init

+ (instancetype)config {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[KMQErrorConfig alloc] init];
    });
    return instance;
}

- (void)checkAndDefaultConfig {
    NSAssert(self.defaultErrorDomain, @"Please set the default error domain.");
    NSAssert(self.errorPListResourcePath, @"Please specifiy the error plist which the errors will be read from.");
    
    if (!self.defaultErrorMessageKey) {
        self.defaultErrorMessageKey = NSLocalizedRecoverySuggestionErrorKey;
    }
    
    if (!self.fallbackErrorMessage) {
        self.fallbackErrorMessage = NSLocalizedString(@"Something went wrong", nil);
    }
    
    if (![[NSError class] respondsToSelector:NSSelectorFromString(ErrorNameCodeMapping)]) {
        NSLog(@"errorNameCodeMapping category method on NSError not detected, please use KMQCocoaCodeGen to generate NSError+ErrorCode");
        [NSException raise:@"method not found" format:@"errorNameCodeMapping category method on NSError not found"];
    }
}

- (void)loadErrorConfig {
    _errors = [NSDictionary dictionaryWithContentsOfFile:self.errorPListResourcePath];
    
    [_errors enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSAssert([obj isKindOfClass:[NSDictionary class]], @"Please maintain a two level dictionary structure according to error plist convention");
    }];
}

#pragma mark -
#pragma mark - Lookup

- (NSDictionary *)userInfoForErrorDomain:(NSString * _Nonnull)errorDomain
                               errorCode:(NSInteger)errorCode
                                 context:(NSString * _Nullable)context
                              parameters:(NSDictionary * _Nullable)parameters {
    NSDictionary *errorsForDomain = _errors[errorDomain];
    NSDictionary *userInfo = errorsForDomain[[self errorKeyForNumericCode:errorCode context:context]];
    if (!userInfo) {
        NSDictionary *codeNameMapping = [[NSError class] performSelector:NSSelectorFromString(ErrorNameCodeMapping)];
        NSString *errorKey = [self errorKeyForTextualCode:codeNameMapping[@(errorCode)] context:context];
        userInfo = errorsForDomain[errorKey];
        if (!userInfo) {
            userInfo = @{};
        }
    }
    
    NSMutableDictionary *renderedUserInfo = [userInfo mutableCopy];
    if (!userInfo[self.defaultErrorMessageKey]) {
        [renderedUserInfo setObject:self.fallbackErrorMessage forKey:self.defaultErrorMessageKey];
    }
    for (NSString *key in userInfo) {
        NSString *localized = NSLocalizedString(userInfo[key], nil);
        NSString *rendered = [GRMustacheTemplate renderObject:parameters fromString:localized error:nil];
        [renderedUserInfo setObject:rendered forKey:key];
    }
    
    return renderedUserInfo;
}

#pragma mark -
#pragma mark - Error code format

- (NSString *)errorKeyForNumericCode:(NSInteger)errorCode context:(NSString * _Nullable)context {
    return [NSString stringWithFormat:@"%ld:%@", errorCode, context == nil ? @"*" : context];
}

- (NSString *)errorKeyForTextualCode:(NSString *)errorCode context:(NSString * _Nullable)context {
    return [NSString stringWithFormat:@"%@:%@", errorCode, context == nil ? @"*" : context];
}

@end
