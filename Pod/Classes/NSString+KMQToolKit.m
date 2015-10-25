//
//  NSString+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "NSString+KMQToolKit.h"

@implementation NSString (KMQToolKit)

+ (NSString *)stringForNSInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%ld", integer];
}

@end
