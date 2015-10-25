//
//  UIViewController+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "UIViewController+KMQToolKit.h"

@implementation UIViewController (KMQToolKit)

#pragma mark -
#pragma mark - Init

+ (__kindof UIViewController * _Nullable) controllerWithIdentifier:(NSString * _Nonnull)identifier
                                            fromStoryboardWithName:(NSString * _Nonnull)storyboardName
                                                          inBundle:(NSBundle * _Nullable)bundle {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:bundle];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

#pragma mark -
#pragma mark - View controller composition

- (void)addToParentController:(UIViewController * _Nonnull)parentViewController inView:(UIView * _Nonnull)view {
    [parentViewController addChildViewController:self];
    [view addSubview:self.view];
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    [self didMoveToParentViewController:parentViewController];
}

- (void)addSubController:(UIViewController * _Nonnull)subViewController inView:(UIView * _Nonnull)view {
    [self addChildViewController:subViewController];
    [view addSubview:subViewController.view];
    subViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    [subViewController didMoveToParentViewController:self];
}

@end
