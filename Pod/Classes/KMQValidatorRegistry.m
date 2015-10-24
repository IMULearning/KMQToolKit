//
//  KMQValidatorRegistry.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQValidatorRegistry.h"

@interface KMQValidatorRegistry ()

@property (nonatomic, strong) NSMutableDictionary *registrar;

@end

@implementation KMQValidatorRegistry

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[KMQValidatorRegistry alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _registrar = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (void)registerValidator:(id<KMQValidator> _Nonnull)validator forKey:(NSString * _Nonnull)key {
    [[KMQValidatorRegistry instance].registrar setObject:validator forKey:key];
}

+ (void)removeValidatorForKey:(NSString * _Nonnull)key {
    [[KMQValidatorRegistry instance].registrar removeObjectForKey:key];
}

+ (id<KMQValidator> _Nullable)validatorForKey:(NSString * _Nonnull)key {
    return [[KMQValidatorRegistry instance].registrar objectForKey:key];
}

@end
