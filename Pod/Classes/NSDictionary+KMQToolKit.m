//
//  NSDictionary+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "NSDictionary+KMQToolKit.h"

@implementation NSDictionary (KMQToolKit)

// Allows access to several levels down for the dictionary
- (id) objectForTransitiveKey:(NSString *)key delimiter:(NSString *)delimiter {
    NSArray *paths = [key componentsSeparatedByString:delimiter];
    id cursor = self;
    for (NSString *path in paths) {
        if (![cursor isKindOfClass:[NSDictionary class]]) {
            return nil;
        }
        cursor = [self objectForKey:path];
    }
    return cursor;
}

@end
