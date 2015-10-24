//
//  NSBundle+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (KMQToolKit)

+ (NSString * _Nullable) plistPathForResource:(NSString *)resourceName inBundleOfClass:(Class _Nonnull)aClass;

@end
