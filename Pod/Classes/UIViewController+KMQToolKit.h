//
//  UIViewController+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (KMQToolKit)

#pragma mark -
#pragma mark - Init

+ (__kindof UIViewController * _Nullable) controllerWithIdentifier:(NSString * _Nonnull)identifier
                                            fromStoryboardWithName:(NSString * _Nonnull)storyboardName
                                                          inBundle:(NSBundle * _Nullable)bundle;

#pragma mark -
#pragma mark - View controller composition

- (void)addToParentController:(UIViewController * _Nonnull)parentViewController inView:(UIView * _Nonnull)view;
- (void)addSubController:(UIViewController * _Nonnull)subViewController inView:(UIView * _Nonnull)view;

@end
