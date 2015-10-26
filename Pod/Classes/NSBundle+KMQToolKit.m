//
//  NSBundle+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "NSBundle+KMQToolKit.h"

@implementation NSBundle (KMQToolKit)

+ (NSString * _Nullable) plistPathForResource:(NSString * _Nonnull)resourceName {
    return [[NSBundle mainBundle] pathForResource:resourceName ofType:@"plist"];
}

+ (NSString * _Nullable) plistPathForResource:(NSString *)resourceName inBundleOfClass:(Class _Nonnull)aClass {
    return [[NSBundle bundleForClass:aClass] pathForResource:resourceName ofType:@"plist"];
}

@end
