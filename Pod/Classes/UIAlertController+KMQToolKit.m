//
//  UIAlertController+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "UIAlertController+KMQToolKit.h"

@implementation UIAlertController (KMQToolKit)

+ (instancetype _Nonnull)alertControllerWithTitle:(nullable NSString *)title
                                          message:(nullable NSString *)message
                                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                                          actions:(NSArray<UIAlertAction *> * _Nullable)actions {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    [controller addActions:actions == nil ? @[] : actions];
    return controller;
}

- (void)addActions:(NSArray<UIAlertAction *> * _Nonnull)actions {
    [actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addAction:obj];
    }];
}

@end
