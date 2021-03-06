//
//  KMQNSNumberValidator.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidator.h"

@interface KMQNSNumberValidator : NSObject <KMQValidator>

@property (nonatomic, strong) NSNumber * _Nonnull min;

@property (nonatomic, strong) NSNumber * _Nonnull max;

+ (id <KMQValidator> _Nonnull) valueBetweenMin:(NSNumber * _Nonnull)min max:(NSNumber * _Nonnull)max;

@end
