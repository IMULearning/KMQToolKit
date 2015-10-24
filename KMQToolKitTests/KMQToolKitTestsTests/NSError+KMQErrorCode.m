#import "NSError+KMQErrorCode.h"

@implementation NSError (KMQErrorCode)

+ (NSDictionary *)errorNameCodeMapping {
	return @{

			@102: @"EmailValidationFailed",

			@103: @"PasswordValidationFailed",

			@104: @"FirstNameValidationFailed",

			@105: @"LastNameValidationFailed",

			@106: @"TextInsufficientLength",

			@107: @"GetGravatarFailed",

	};
}

@end