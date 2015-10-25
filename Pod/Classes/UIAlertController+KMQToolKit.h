//
//  UIAlertController+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import <UIKit/UIKit.h>

@interface UIAlertController (KMQToolKit)

+ (instancetype _Nonnull)alertControllerWithTitle:(nullable NSString *)title
                                          message:(nullable NSString *)message
                                   preferredStyle:(UIAlertControllerStyle)preferredStyle
                                          actions:(NSArray<UIAlertAction *> * _Nullable)actions;

- (void)addActions:(NSArray<UIAlertAction *> * _Nonnull)actions;

@end
