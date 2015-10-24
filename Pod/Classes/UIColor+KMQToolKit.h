//
//  UIColor+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (KMQToolKit)

+ (void)setupColorPalleteWithContentsOfFile:(NSString *)plistName keyInFile:(NSString *)key;

+ (UIColor *)hexColor:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
