//
//  NSArray+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (KMQToolKit)

- (BOOL)intersects:(NSArray *)another;

- (BOOL)isSubArrayOf:(NSArray *)another;

@end
