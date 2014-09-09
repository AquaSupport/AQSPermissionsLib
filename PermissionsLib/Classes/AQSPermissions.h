//
//  AQSPermissions.h
//  PermissionsLib
//
//  Created by kaiinui on 2014/09/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AQSPermissions : NSObject

+ (void)askCameraRollPermissionWithBlock:(void(^)(BOOL permission))block;
+ (BOOL)checkCameraRollPermission;

@end
