//
//  KMQColorPalette.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>

@interface KMQColorPalette : NSObject

+ (void)addColor:(UIColor * _Nonnull)color forName:(NSString * _Nonnull)name;

+ (void)removeColorForName:(NSString * _Nonnull)name;

+ (UIColor * _Nullable)colorForName:(NSString * _Nonnull)name;

@end
