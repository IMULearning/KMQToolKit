//
//  UIImagePickerController+KMQToolKit.h
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (KMQToolKit)

#pragma mark -
#pragma mark - shorthand for UIImagePickerControllerSourceType

+ (BOOL)isSavedPhotosAlbumAvailable;
+ (BOOL)isPhotoLibraryAvailable;
+ (BOOL)isCameraAvailable;

#pragma mark -
#pragma mark - shorthand for UIImagePickerControllerCameraDevice

+ (BOOL)isFrontCameraAvailable;
+ (BOOL)isRearCameraAvailable;


@end
