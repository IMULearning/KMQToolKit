//
//  KMQColorPalette.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQColorPalette.h"

@interface KMQColorPalette ()

@property (nonatomic, strong) NSMutableDictionary *palette;

@end

@implementation KMQColorPalette

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[KMQColorPalette alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.palette = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (void)addColor:(UIColor * _Nonnull)color forName:(NSString * _Nonnull)name {
    [[KMQColorPalette instance].palette setObject:color forKey:name];
}

+ (void)removeColorForName:(NSString * _Nonnull)name {
    [[KMQColorPalette instance].palette removeObjectForKey:name];
}

+ (UIColor * _Nullable)colorForName:(NSString * _Nonnull)name {
    return [KMQColorPalette instance].palette[name];
}

@end
