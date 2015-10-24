//
//  NSDictionary+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (KMQToolKit)

// Allows access to several levels down for the dictionary
- (id) objectForTransitiveKey:(NSString *)key delimiter:(NSString *)delimiter;

@end
