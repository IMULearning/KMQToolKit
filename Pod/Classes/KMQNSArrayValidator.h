//
//  KMQNSArrayValidator.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidator.h"

@interface KMQNSArrayValidator : NSObject <KMQValidator>

@property (nonatomic, assign) BOOL allowNull;
@property (nonatomic, assign) NSUInteger minSize;
@property (nonatomic, assign) NSUInteger maxSize;

@property (nonatomic, strong) NSArray * _Nullable mandatoryElements;
@property (nonatomic, strong) NSArray * _Nullable disallowedElements;

+ (id <KMQValidator> _Nonnull)arrayContainsElements:(NSArray * _Nonnull)mandatoryElements;

@end
