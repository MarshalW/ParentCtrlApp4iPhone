//
//  BindRouterViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BindRouterViewController.h"

@interface BindRouterViewController ()

@end

@implementation BindRouterViewController


- (IBAction)bindRouter:(id)sender {
    //TODO 绑定路由的正式代码
    [[ApplicationContext sharedContext] bindRouter];
    
    //去首页
    [ApplicationContext gotoState:@"Home" params:nil];
}

@end
