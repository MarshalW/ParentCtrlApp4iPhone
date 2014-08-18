//
//  DeviceInfo.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-16.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject

{
    NSNumber *networkSpeed;//网速
    long totalTime;//总的时长
}

- (id)initWithNetworkSpeed:(long)speed;


@end
