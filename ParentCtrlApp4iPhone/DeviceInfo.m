//
//  DeviceInfo.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-16.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

long countNetworkSpeed=0;

#import "DeviceInfo.h"

@implementation DeviceInfo

- (id)initWithNetworkSpeed:(long)speed
{
    self = [super init];
    if (self) {
        self.networkSpeed=[NSNumber numberWithLong:speed];
    }
    return self;
}

////模拟设备信息的变化
//- (id)init
//{
//    self = [super init];
//    if (self) {
//        [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
//    }
//    return self;
//}
//
//- (void)timerAction:(NSTimer*)timer
//{
////    NSLog(@"networkSpeed: %@",networkSpeed);
//
//    [self setValue:[NSNumber numberWithLong:(countNetworkSpeed++) ] forKey:@"networkSpeed"];
//}

@end
