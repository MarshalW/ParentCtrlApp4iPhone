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

@end
