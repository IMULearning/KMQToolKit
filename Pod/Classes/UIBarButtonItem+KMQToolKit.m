//
//  UIBarButtonItem+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "UIBarButtonItem+KMQToolKit.h"

@implementation UIBarButtonItem (KMQToolKit)

+ (UIBarButtonItem * _Nonnull) spacerWithWidth:(CGFloat)width {
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = width;
    return spacer;
}

@end
