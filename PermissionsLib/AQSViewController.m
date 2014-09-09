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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [AQSPermissions askPhotoLibraryPermissionWithBlock:^(BOOL permission) {
        NSLog(@"%hhd", permission);
        
        NSLog(@"%hhd", [AQSPermissions checkPhotoLibraryPermission]);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
