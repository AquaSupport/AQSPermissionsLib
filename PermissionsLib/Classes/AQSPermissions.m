// MACRO's for debug
//  - AQSPERM_EMULATE_DENIED
//  - AQSPERM_EMULATE_ASKALWAYS

#import "AQSPermissions.h"

// CameraRoll
#import <AssetsLibrary/AssetsLibrary.h>

@implementation AQSPermissions

# pragma mark - Camera Roll

+ (void)askPhotoLibraryPermissionWithBlock:(void (^)(BOOL permission))block {
    if ([self hasPhotoLibraryPermissionChecked] == YES) {
        block([self checkPhotoLibraryPermission]);
        return;
    }
    
#ifdef AQSPERM_ASK_ALWAYS
    [self presentEmulatedPermissionAlertWithBlock:block];
    return;
#endif
    
    [self checkPermissionWithBlock:block];
}

+ (BOOL)checkPhotoLibraryPermission {
#ifndef AQSPERM_EMULATE_DENIED
    return ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized);
#else
    return NO;
#endif
}

+ (BOOL)isPhotoLibraryPermissionDenied {
#ifndef AQSPERM_EMULATE_DENIED
    return ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied);
#else
    return YES;
#endif
}

# pragma mark - Helpers (Camera Roll)

+ (void)checkPermissionWithBlock:(void(^)(BOOL permission))block {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupEvent usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        block(YES);
    } failureBlock:^(NSError *error) {
        if (error.code != ALAssetsLibraryAccessUserDeniedError) { return; }
        block(NO);
    }];
}

+ (BOOL)hasPhotoLibraryPermissionChecked {
#ifdef AQSPERM_EMULATE_DENIED
    return YES;
#endif
#ifdef AQSPERM_ASK_ALWAYS
    return NO;
#endif
    return ([ALAssetsLibrary authorizationStatus] != ALAuthorizationStatusNotDetermined);
}

# pragma mark - Helpers (UIAlertController)

+ (void)presentEmulatedPermissionAlertWithBlock:(void(^)(BOOL permission))block {
    UIViewController *current = [self getRootViewController];
    [current presentViewController:[self emuratedPermissionAlertWithBlock:block] animated:YES completion:nil];
}

+ (UIAlertController *)emuratedPermissionAlertWithBlock:(void(^)(BOOL permission))block {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[self emulatedPermissionAlertTitle] message:[self emulatedPermissionAlertMessage] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        block(YES);
    }];
    [alert addAction:ok];
    UIAlertAction *deny = [UIAlertAction actionWithTitle:@"Don't Allow" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        block(NO);
    }];
    [alert addAction:deny];
    return alert;
}

+ (NSString *)emulatedPermissionAlertTitle {
    return [NSString stringWithFormat:@"\"%@\" Would Like to Access Your Photos", [self appNameFromPlist]];
}

+ (NSString *)emulatedPermissionAlertMessage {
    return [self permissionUsageFromPlist];
}

+ (NSString *)permissionUsageFromPlist {
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    return [info objectForKey:@"NSPhotoLibraryUsageDescription"];
}

// @see http://stackoverflow.com/questions/1247142/getting-an-iphone-apps-product-name-at-runtime
+ (NSString *)appNameFromPlist {
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    return [info objectForKey:@"CFBundleDisplayName"];
}

# pragma mark - Helpers (Current UIViewController Hack)

// Derived from Appirater
// @see https://github.com/arashpayan/appirater/blob/master/Appirater.m
+ (id)getRootViewController {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    
    for (UIView *subView in [window subviews])
    {
        UIResponder *responder = [subView nextResponder];
        if([responder isKindOfClass:[UIViewController class]]) {
            return [self topMostViewController: (UIViewController *) responder];
        }
    }
    
    return nil;
}

+ (UIViewController *) topMostViewController: (UIViewController *) controller {
    BOOL isPresenting = NO;
    do {
        // this path is called only on iOS 6+, so -presentedViewController is fine here.
        UIViewController *presented = [controller presentedViewController];
        isPresenting = presented != nil;
        if(presented != nil) {
            controller = presented;
        }
        
    } while (isPresenting);
    
    return controller;
}

@end
