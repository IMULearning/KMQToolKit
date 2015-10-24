//
//  KMQErrorConfig.h
//  A configuration repository and data source to be used by |NSError+KMQToolKit|.
//  This class is not intended to be used directly.
//
//  Created by Weinan Qiu on 2015-10-23.
//
//

#import <Foundation/Foundation.h>

@interface KMQErrorConfig : NSObject

@property (nonatomic, strong) NSString *defaultErrorDomain;
@property (nonatomic, strong) NSString *errorPListResourcePath;
@property (nonatomic, strong) NSString *defaultErrorMessageKey;
@property (nonatomic, strong) NSString *fallbackErrorMessage;

// Retrieve singlton instance
+ (instancetype)config;

// Check the config validity and default optional fields
- (void)checkAndDefaultConfig;

// Load the errors from the specified error plist file
- (void)loadErrorConfig;

// Lookup the user info dictionary
- (NSDictionary *)userInfoForErrorDomain:(NSString *)errorDomain
                               errorCode:(NSInteger)errorCode
                                 context:(NSString *)context
                              parameters:(NSDictionary *)parameters;

@end
