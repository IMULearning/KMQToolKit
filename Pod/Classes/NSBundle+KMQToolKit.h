//
//  NSBundle+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (KMQToolKit)

+ (NSString * _Nullable) plistPathForResource:(NSString * _Nonnull)resourceName;
+ (NSString * _Nullable) plistPathForResource:(NSString * _Nonnull)resourceName inBundleOfClass:(Class _Nonnull)aClass;

@end
