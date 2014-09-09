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
 Asks a permission to access the camera roll.
 You do not have to make sure to call this method only once. You can call this method as many as possible.
 @param block It will be called with boolean value whether the permission has granted, when the ask completed.
 */
+ (void)askCameraRollPermissionWithBlock:(void(^)(BOOL permission))block;

/**
 Check whether the permission to access the camera roll has granted.
 @return whether permission has granted
 */
+ (BOOL)checkCameraRollPermission;

@end
