//
//  UIColor+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "UIColor+KMQToolKit.h"
#import "NSDictionary+KMQToolKit.h"
#import "KMQColorPalette.h"


@implementation UIColor (KMQToolKit)

+ (void)setupColorPalleteWithContentsOfFile:(NSString *)filePath keyInFile:(NSString *)key {
    NSDictionary *colors = [[NSDictionary dictionaryWithContentsOfFile:filePath] objectForTransitiveKey:key delimiter:@"."];
    [colors enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSAssert([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSDictionary class]], @"Each elements should either by string or dictionary");
        if ([obj isKindOfClass:[NSString class]]) {
            [KMQColorPalette addColor:[UIColor hexColor:obj alpha:1.0] forName:key];
        } else {
            NSAssert([obj[@"color"] isKindOfClass:[NSString class]], @"Key 'color' must be specified as string");
            NSAssert([obj[@"alpha"] isKindOfClass:[NSNumber class]], @"Key 'alpha must be specified as integer'");
            
            NSString *hex = obj[@"color"];
            NSNumber *alpha = obj[@"alpha"];
            NSAssert([alpha intValue] >= 0 && [alpha intValue] <= 255, @"Key 'alpha' value must be between 0 and 200");
            
            [KMQColorPalette addColor:[UIColor hexColor:hex alpha:[alpha floatValue] / 255.0f] forName:key];
        }
    }];
}

+ (UIColor *)hexColor:(NSString *)hexStr alpha:(CGFloat)alpha {
    unsigned int hexInt = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexInt & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

@end
