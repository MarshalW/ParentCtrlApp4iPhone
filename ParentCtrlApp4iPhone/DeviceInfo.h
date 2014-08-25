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
    long totalTime;//总的时长
}

@property(nonatomic,assign) int rid;

@property(nonatomic,assign) NSNumber *networkSpeed;

- (id)initWithNetworkSpeed:(long)speed;

@end
