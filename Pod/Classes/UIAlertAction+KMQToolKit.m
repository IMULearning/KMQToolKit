//
//  UIAlertAction+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "UIAlertAction+KMQToolKit.h"

@implementation UIAlertAction (KMQToolKit)

+ (UIAlertAction *) actionWithTitle:(NSString *)title
                              style:(UIAlertActionStyle)style
                             object:(id)responder
                           selector:(SEL)aSelector {
    return [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        if ([responder respondsToSelector:aSelector])
            [responder performSelector:aSelector withObject:nil];
    }];
}

+ (UIAlertAction *) actionWithTitle:(NSString *)title
                              style:(UIAlertActionStyle)style
                         dismissing:(UIAlertController *)alertController {
    return [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
