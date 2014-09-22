//
//  AQSViewController.m
//  PermissionsLib
//
//  Created by kaiinui on 2014/09/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSViewController.h"

#import "AQSPermissions.h"

@interface AQSViewController ()

@end

@implementation AQSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [AQSPermissions askPhotoLibraryPermissionWithBlock:^(BOOL permission) {
        NSLog(@"%d", permission);
        
        NSLog(@"%d", [AQSPermissions checkPhotoLibraryPermission]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
