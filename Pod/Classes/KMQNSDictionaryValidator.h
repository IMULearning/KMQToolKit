//
//  KMQNSDictionaryValidator.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidator.h"

@interface KMQNSDictionaryValidator : NSObject <KMQValidator>

@property (nonatomic, assign) BOOL allowNull;
@property (nonatomic, assign) NSUInteger minSize;
@property (nonatomic, assign) NSUInteger maxSize;

@property (nonatomic, strong) NSArray * _Nullable mandatoryKeys;
@property (nonatomic, strong) NSArray * _Nullable disallowedKeys;

+ (id <KMQValidator> _Nonnull)dictionaryContainsKeys:(NSArray * _Nonnull)mandatoryKeys;

@end
