//
//  DeviceSettingViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-25.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "DeviceSettingViewController.h"

@interface DeviceSettingViewController ()

@end

@implementation DeviceSettingViewController

- (void) setParams:(NSDictionary *) _params
{
    [super setParams:_params];

    deviceInfo=[params objectForKey:@"device"];
    
    NSLog(@"get device info: %@",deviceInfo);
}
@end
