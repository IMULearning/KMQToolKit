//
//  NSError+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-23.
//
//

#import "NSError+KMQToolKit.h"
#import "KMQErrorConfig.h"

@implementation NSError (KMQToolKit)

#pragma mark -
#pragma mark - Init

+ (void) setupToolKitWithDefaultErrorDomain:(NSString * _Nonnull)defaultDomain
                                 errorPList:(NSString * _Nonnull)errorPListResourcePath
                            defaultErrorKey:(NSString * _Nullable)defaultErrorKey
                       fallbackErrorMessage:(NSString * _Nullable)fallbackErrorMessage {
    [KMQErrorConfig config].defaultErrorDomain = defaultDomain;
    [KMQErrorConfig config].errorPListResourcePath = errorPListResourcePath;
    [KMQErrorConfig config].defaultErrorMessageKey = defaultErrorKey;
    [KMQErrorConfig config].fallbackErrorMessage = fallbackErrorMessage;
    
    [[KMQErrorConfig config] checkAndDefaultConfig];
    [[KMQErrorConfig config] loadErrorConfig];
}

#pragma mark -
#pragma mark - Factory methods

+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode {
    return [NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain code:errorCode];
}

+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode
                            context:(NSString * _Nullable)context {
    return [NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain code:errorCode context:context];
}

+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode
                            context:(NSString * _Nullable)context
                         parameters:(NSDictionary * _Nullable)parameters {
    return [NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain code:errorCode context:context parameters:parameters];
}

+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode {
    return [NSError errorForDomain:errorDomain code:errorCode context:nil parameters:nil];
}

+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode
                              context:(NSString * _Nullable)context {
    return [NSError errorForDomain:errorDomain code:errorCode context:context parameters:nil];
}

+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode
                              context:(NSString * _Nullable)context
                           parameters:(NSDictionary * _Nullable)parameters {
    NSDictionary *userInfo = [[KMQErrorConfig config] userInfoForErrorDomain:errorDomain errorCode:errorCode context:context parameters:parameters];
    return [NSError errorWithDomain:errorDomain code:errorCode userInfo:userInfo];
}

#pragma mark -
#pragma mark - Convenience for message

+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode {
    return [[NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain
                               code:errorCode] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode
                               context:(NSString * _Nullable)context {
    return [[NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain
                               code:errorCode
                            context:context] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode
                               context:(NSString * _Nullable)context
                            parameters:(NSDictionary * _Nullable)parameters {
    return [[NSError errorForDomain:[KMQErrorConfig config].defaultErrorDomain
                               code:errorCode
                            context:context
                         parameters:parameters] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode {
    return [[NSError errorForDomain:errorDomain
                               code:errorCode] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode
                                 context:(NSString * _Nullable)context {
    return [[NSError errorForDomain:errorDomain
                               code:errorCode
                            context:context] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode
                                 context:(NSString * _Nullable)context
                              parameters:(NSDictionary * _Nullable)parameters {
    return [[NSError errorForDomain:errorDomain
                               code:errorCode
                            context:context
                         parameters:parameters] defaultErrorMessage];
}

#pragma mark -
#pragma mark - Convert from error

+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error {
    return [NSError errorForDomain:error.domain code:error.code];
}

+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error
                              context:(NSString * _Nullable)context {
    return [NSError errorForDomain:error.domain code:error.code context:context];
}

+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error
                              context:(NSString * _Nullable)context
                           parameters:(NSDictionary * _Nullable)parameters {
    return [NSError errorForDomain:error.domain code:error.code context:context parameters:parameters];
}

#pragma mark -
#pragma mark - Convert from error and get message

+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error {
    return [[NSError errorFromError:error] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error
                                 context:(NSString * _Nullable)context {
    return [[NSError errorFromError:error context:context] defaultErrorMessage];
}

+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error
                                 context:(NSString * _Nullable)context
                              parameters:(NSDictionary * _Nullable)parameters {
    return [[NSError errorFromError:error context:context parameters:parameters] defaultErrorMessage];
}

#pragma mark -
#pragma mark - Utility

- (NSString * _Nonnull)defaultErrorMessage {
    return self.userInfo[[KMQErrorConfig config].defaultErrorMessageKey];
}

@end
