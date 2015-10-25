//
//  NSArray+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "NSArray+KMQToolKit.h"

@implementation NSArray (KMQToolKit)

- (BOOL)intersects:(NSArray *)another {
    if (another == nil)
        return NO;
    
    for (NSObject *eachInAnother in another) {
        for (int i = 0; i < self.count; i++) {
            NSObject *eachInSelf = [self objectAtIndex:i];
            if ([eachInAnother isEqual:eachInSelf])
                return YES;
        }
    }
    return NO;
}

- (BOOL)isSubArrayOf:(NSArray *)another {
    if (another == nil)
        return NO;
    
    for (int i = 0; i < self.count; i++) {
        NSObject *eachInSelf = [self objectAtIndex:i];
        if (![another containsObject:eachInSelf])
            return NO;
    }
    return YES;
}

@end
