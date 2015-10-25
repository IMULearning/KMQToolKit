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
- (id) objectForTransitiveKey:(NSString *)key {
    return [self objectForTransitiveKey:key delimiter:@"."];
}

- (id) objectForTransitiveKey:(NSString *)key delimiter:(NSString *)delimiter {
    NSAssert(key != nil, @"Key must not be nil");
    NSAssert(delimiter != nil, @"Delimiter must not be nil");
    NSArray *paths = [key componentsSeparatedByString:delimiter];
    
    if (paths.count == 1)
        return [self objectForKey:paths[0]];
    
    NSObject *cursor = [self objectForKey:paths[0]];
    for (int i = 1; i < paths.count - 1; i++) {
        if (![cursor isKindOfClass:[NSDictionary class]])
            return nil;
        cursor = [((NSDictionary *)cursor) objectForKey:paths[i]];
    }
    return [((NSDictionary *)cursor) objectForKey:paths[paths.count - 1]];
}

@end
