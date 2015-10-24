//
//  KMQValidationConstants.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>

// Error Domain
extern NSString * const KMQValidationErrorDomain;

// UserInfo keys - String
extern NSString *const KMQValidationStringMinLengthKey;
extern NSString *const KMQValidationStringMaxLengthKey;
extern NSString *const KMQValidationStringDisallowedCharsetKey;
extern NSString *const KMQValidationStringDisallowedSubStringKey;
extern NSString *const KMQValidationStringRegexKey;

// UserInfo keys - Number
extern NSString *const KMQValidationNumberMinKey;
extern NSString *const KMQValidationNumberMaxKey;

// UserInfo keys - Array
extern NSString *const KMQValidationArrayMinSizeKey;
extern NSString *const KMQValidationArrayMaxSizeKey;

// UserInfo keys - Dictionary
extern NSString *const KMQValidationDictionaryMinSizeKey;
extern NSString *const KMQValidationDictionaryMaxSizeKey;
extern NSString *const KMQValidationDictionaryMandatoryKey;
extern NSString *const KMQValidationDictionaryDisallowedKey;

// Error codes
typedef NS_ENUM(NSInteger, KMQValidationErrorCode) {
    // String
    kKMQValidationErrorStringIsNull = 0,
    kKMQValidationErrorStringIsEmpty = 1,
    kKMQValidationErrorStringTooShort = 2,
    kKMQValidationErrorStringTooLong = 3,
    kKMQValidationErrorStringContainsDisallowedCharset = 4,
    kKMQValidationErrorStringContainsDisallowedSubstring = 5,
    kKMQValidationErrorStringRegexMismatch = 6,
    
    kKMQValidationErrorNumberToSmall = 7,
    kKMQValidationErrorNumberToBig = 8,
    
    kKMQValidationErrorArrayIsNull = 9,
    kKMQValidationErrorArrayTooSmall = 10,
    kKMQValidationErrorArrayTooBig = 11,
    
    kKMQValidationErrorDictionaryIsNull = 12,
    kKMQValidationErrorDictionaryTooSmall = 13,
    kKMQValidationErrorDictionaryTooBig = 14,
    kKMQValidationErrorDictionaryMissingMandatoryKey = 15,
    kKMQValidationErrorDictionaryContainsDisallowedKey = 16,
};

// Other constants
extern NSString *const KMQValidationEmailRegexStrict;
extern NSString *const KMQValidationEmailRegex;

@interface KMQValidationConstants : NSObject

@end
