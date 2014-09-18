//
//  AQSPermissions.m
//  PermissionsLib
//
//  Created by kaiinui on 2014/09/09.
//  Copyright (c) 2014 Aquamarine. All rights reserved.
//

#import "AQSPermissions.h"

// CameraRoll
#import <AssetsLibrary/AssetsLibrary.h>

@implementation AQSPermissions

# pragma mark - Camera Roll

+ (void)askPhotoLibraryPermissionWithBlock:(void (^)(BOOL permission))block {
    if ([self hasPhotoLibraryPermissionChecked]) {
        block([self checkPhotoLibraryPermission]);
        return;
    }
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupEvent usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        block(YES);
    } failureBlock:^(NSError *error) {
        if (error.code != ALAssetsLibraryAccessUserDeniedError) { return; }
        block(NO);
    }];
}

+ (BOOL)checkPhotoLibraryPermission {
    return ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized);
}

+ (BOOL)isPhotoLibraryPermissionDenied {
    return ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied);
}

# pragma mark - Helpers (Camera Roll)

+ (BOOL)hasPhotoLibraryPermissionChecked {
    return ([ALAssetsLibrary authorizationStatus] != ALAuthorizationStatusNotDetermined);
}

@end
