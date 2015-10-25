//
//  UIImagePickerController+KMQToolKit.m
//  Pods
//
//  Created by Weinan Qiu on 2015-10-25.
//
//

#import "UIImagePickerController+KMQToolKit.h"

@implementation UIImagePickerController (KMQToolKit)

#pragma mark -
#pragma mark - shorthand for UIImagePickerControllerSourceType

+ (BOOL)isSavedPhotosAlbumAvailable {
    return [self isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}

+ (BOOL)isPhotoLibraryAvailable {
    return [self isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}
+ (BOOL)isCameraAvailable {
    return [self isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark -
#pragma mark - shorthand for UIImagePickerControllerCameraDevice

+ (BOOL)isFrontCameraAvailable {
    return [self isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)isRearCameraAvailable {
    return [self isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

@end
