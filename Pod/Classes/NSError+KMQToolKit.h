//
//  NSError+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-23.
//
//

#import <Foundation/Foundation.h>

@interface NSError (KMQToolKit)

#pragma mark -
#pragma mark - Init

// Convenience method to setup |KMQErrorConfig| and load the configuration according to the setup
// Suggested to setup in |AppDelegate|
+ (void) setupToolKitWithDefaultErrorDomain:(NSString * _Nonnull)defaultDomain
                                 errorPList:(NSString * _Nonnull)errorPListResourcePath
                            defaultErrorKey:(NSString * _Nullable)defaultErrorKey
                       fallbackErrorMessage:(NSString * _Nullable)fallbackErrorMessage;

#pragma mark -
#pragma mark - Factory methods

// Constructs an |NSError| with default error domain and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode;

// Constructs an |NSError| with default error domain and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode
                              context:(NSString * _Nullable)context;

// Constructs an |NSError| with default error domain and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForCode:(NSInteger)errorCode
                              context:(NSString * _Nullable)context
                           parameters:(NSDictionary * _Nullable)parameters;

// Constructs an |NSError| and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode;

// Constructs an |NSError| and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode
                              context:(NSString * _Nullable)context;

// Constructs an |NSError| and populates userInfo from the error plist config file
+ (NSError * _Nonnull) errorForDomain:(NSString * _Nonnull)errorDomain
                                 code:(NSInteger)errorCode
                              context:(NSString * _Nullable)context
                           parameters:(NSDictionary * _Nullable)parameters;

#pragma mark -
#pragma mark - Convenience for message

// Get message for error code for default domain
+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode;

// Get message for error code for default domain in context
+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode
                              context:(NSString * _Nullable)context;

// Get message for error code for default domain in context with parameters
+ (NSString * _Nonnull) messageForCode:(NSInteger)errorCode
                               context:(NSString * _Nullable)context
                            parameters:(NSDictionary * _Nullable)parameters;

// Get message for error code in domain
+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode;

// Get message for error code in domain and context
+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode
                                 context:(NSString * _Nullable)context;

// Get message for error code in domain and context with parameters
+ (NSString * _Nonnull) messageForDomain:(NSString * _Nonnull)errorDomain
                                    code:(NSInteger)errorCode
                                 context:(NSString * _Nullable)context
                              parameters:(NSDictionary * _Nullable)parameters;

#pragma mark -
#pragma mark - Convert from error

// Convert from third party error
+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error;

// Convert from third party error
+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error
                              context:(NSString * _Nullable)context;

// Convert from third party error
+ (NSError * _Nonnull) errorFromError:(NSError * _Nonnull)error
                              context:(NSString * _Nullable)context
                           parameters:(NSDictionary * _Nullable)parameters;

#pragma mark -
#pragma mark - Convert from error and get message

// Convert from third party error and get message
+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error;

// Convert from third party error and get message
+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error
                                 context:(NSString * _Nullable)context;

// Convert from third party error and get message
+ (NSString * _Nonnull) messageFromError:(NSError * _Nonnull)error
                                 context:(NSString * _Nullable)context
                              parameters:(NSDictionary * _Nullable)parameters;

#pragma mark -
#pragma mark - Utility

// Return the message in |userInfo| designated by |defaultErrorMessageKey| in |KMQErrorConfig|
// Refrain from calling if |defaultErrorMessageKey| in |KMQErrorConfig| is not specified
- (NSString * _Nonnull)defaultErrorMessage;

@end
