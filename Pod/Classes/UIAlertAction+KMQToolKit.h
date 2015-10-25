//
//  UIAlertAction+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (KMQToolKit)

+ (UIAlertAction *) actionWithTitle:(NSString *)title
                              style:(UIAlertActionStyle)style
                             object:(id)responder
                           selector:(SEL)aSelector;

+ (UIAlertAction *) actionWithTitle:(NSString *)title
                              style:(UIAlertActionStyle)style
                         dismissing:(UIAlertController *)alertController;

@end
