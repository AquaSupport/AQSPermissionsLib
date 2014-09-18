//
//  AQSPermissions.h
//  PermissionsLib
//
//  Created by kaiinui on 2014/09/09.
//  Copyright (c) 2014 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AQSPermissions : NSObject

# pragma mark - Camera Roll

/**
 *  Asks a permission to access the Photo Library.
 *  You do not have to make sure to call this method only once. You can call this method as many as possible.
 *  @param block It will be called with boolean value whether the permission has been granted, when the ask completed.
 */
+ (void)askPhotoLibraryPermissionWithBlock:(void(^)(BOOL permission))block;

/**
 *  Check whether the permission to access the Photo Library has been granted.
 *  @return whether permission has been granted
 */
+ (BOOL)checkPhotoLibraryPermission;

/**
 *  Check if the permission to access the Photo Library declined.
 *
 *  @return BOOL
 */
+ (BOOL)isPhotoLibraryPermissionDenied;

@end
