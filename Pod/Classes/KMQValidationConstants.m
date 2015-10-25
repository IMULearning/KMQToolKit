//
//  KMQValidationConstants.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import "KMQValidationConstants.h"

NSString * const KMQValidationErrorDomain = @"KMQValidation";


NSString *const KMQValidationStringMinLengthKey = @"KMQValidationStringMinLength";
NSString *const KMQValidationStringMaxLengthKey = @"KMQValidationStringMaxLength";
NSString *const KMQValidationStringDisallowedCharsetKey = @"KMQValidationStringDisallowedCharset";
NSString *const KMQValidationStringDisallowedSubStringKey = @"KMQValidationStringDisallowedSubString";
NSString *const KMQValidationStringRegexKey = @"KMQValidationStringRegex";


NSString *const KMQValidationNumberMinKey = @"KMQValidationNumberMin";
NSString *const KMQValidationNumberMaxKey = @"KMQValidationNumberMax";


NSString *const KMQValidationArrayMinSizeKey = @"KMQValidationArrayMinSize";
NSString *const KMQValidationArrayMaxSizeKey = @"KMQValidationArrayMaxSize";
NSString *const KMQValidationArrayMandatoryElementsKey = @"KMQValidationArrayMandatoryElements";
NSString *const KMQValidationArrayDisallowedElementsKey = @"KMQValidationArrayDisallowedElements";


NSString *const KMQValidationDictionaryMinSizeKey = @"KMQValidationDictionaryMinSize";
NSString *const KMQValidationDictionaryMaxSizeKey = @"KMQValidationDictionaryMaxSize";
NSString *const KMQValidationDictionaryMandatoryKey = @"KMQValidationDictionaryMandatory";
NSString *const KMQValidationDictionaryDisallowedKey = @"KMQValidationDictionaryDisallowed";


NSString *const KMQValidationEmailRegexStrict = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
NSString *const KMQValidationEmailRegex = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";



@implementation KMQValidationConstants

@end
