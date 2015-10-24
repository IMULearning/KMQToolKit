//
//  KMQValidatorRegistry.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidator.h"

@interface KMQValidatorRegistry : NSObject

+ (void)registerValidator:(id<KMQValidator> _Nonnull)validator forKey:(NSString * _Nonnull)key;

+ (void)removeValidatorForKey:(NSString * _Nonnull)key;

+ (id<KMQValidator> _Nullable)validatorForKey:(NSString * _Nonnull)key;

@end
