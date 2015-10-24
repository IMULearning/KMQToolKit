//
//  KMQValidator.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-24.
//
//

#import <Foundation/Foundation.h>
#import "KMQValidationConstants.h"

@protocol KMQValidator <NSObject>

+ (id <KMQValidator>) validator;

- (BOOL) isValid:(id)object errors:(NSArray **)errors;

@end
