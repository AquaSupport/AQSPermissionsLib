//
//  AQSPermissions.m
//  PermissionsLib
//
//  Created by kaiinui on 2014/09/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSPermissions.h"

// CameraRoll
#import <AssetsLibrary/AssetsLibrary.h>

@implementation AQSPermissions

# pragma mark - CameraRoll

+ (void)askCameraRollPermissionWithBlock:(void (^)(BOOL permission))block {
    if ([self hasCameraRollPermissionChecked]) {
        block([self checkCameraRollPermission]);
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

+ (BOOL)checkCameraRollPermission {
    return ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized);
}

# pragma mark - Helpers (CameraRoll)

+ (BOOL)hasCameraRollPermissionChecked {
    return ([ALAssetsLibrary authorizationStatus] != ALAuthorizationStatusNotDetermined);
}

@end
