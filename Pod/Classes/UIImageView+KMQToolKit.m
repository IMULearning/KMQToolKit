//
//  UIImageView+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "UIImageView+KMQToolKit.h"

@implementation UIImageView (KMQToolKit)

- (void)makeCircleMask {
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0;
}

@end
