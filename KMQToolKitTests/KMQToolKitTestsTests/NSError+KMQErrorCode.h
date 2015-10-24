#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KMQErrorCode) {

	kBlocQueryErrorEmailValidationFailed = 102,

	kBlocQueryErrorPasswordValidationFailed = 103,

	kBlocQueryErrorFirstNameValidationFailed = 104,

	kBlocQueryErrorLastNameValidationFailed = 105,

	kBlocQueryErrorTextInsufficientLength = 106,

	kBlocQueryErrorGetGravatarFailed = 107,
		
};

@interface NSError (KMQErrorCode)

+ (NSDictionary *)errorNameCodeMapping;

@end