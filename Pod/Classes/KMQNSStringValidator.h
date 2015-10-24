//
//  KMQNSStringValidator.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidator.h"

@interface KMQNSStringValidator : NSObject <KMQValidator>

// whether this string is allowed to be |nil|
// default to be NO
@property (nonatomic, assign) BOOL allowNull;

// whether this string is allowed to be of length 0
// default to be NO
@property (nonatomic, assign) BOOL allowEmpty;

// whether to trim this string before doing any validation
// default to be YES
@property (nonatomic, assign) BOOL trimBeforeValidation;

// min length of this string
// default to be 0
@property (nonatomic, assign) NSUInteger minLength;

// max length of this string
// default to be |NSUIntegerMax|
@property (nonatomic, assign) NSUInteger maxLength;

// disallowed character sets in this string
// appearence of any character in this set will be deemed invalid
// it is not enforced unless |disallowedCharacterSet != nil|
// default to nil
@property (nonatomic, strong) NSCharacterSet * _Nullable disallowedCharacterSet;

// disallowed substring in this string
// appearence of any substring in this array will be deemed invalid
// it is not enforced unless |disallowedSubStrings != nil|
// default to nil
@property (nonatomic, strong) NSArray * _Nullable disallowedSubStrings;

// regular expression for this string
// default to nil
@property (nonatomic, strong) NSRegularExpression * _Nullable regularExpression;

#pragma mark -
#pragma mark - Presets

+ (id <KMQValidator> _Nonnull)lengthBetweenMin:(NSUInteger)min max:(NSUInteger)max;

+ (id <KMQValidator> _Nonnull)regex:(NSRegularExpression * _Nonnull)regex;

@end
