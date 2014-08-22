//
//  HomeMenuView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeMenuView.h"
#import "HomeRootView.h"
#import "ApplicationContext.h"

@implementation HomeMenuView

- (IBAction)logout:(id)sender {
    
    [self returnMenu];
    
    [[ApplicationContext sharedContext] logout];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"userName"];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"Login"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
    
    logout=YES;
}

//绑定/解绑路由器
- (IBAction)bindRouter:(id)sender {
    [self returnMenu];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"BindRouterWizard"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
    
    NSLog(@"bind router");
}

//找回已删设备
- (IBAction)findDevice:(id)sender {
    [self returnMenu];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"FindDevice"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

//家长意见簿
- (IBAction)parentAdvise:(id)sender {
    [self returnMenu];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"ParentAdvise"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

- (IBAction)about:(id)sender {
    [self returnMenu];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"About"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

- (IBAction)moreSettings:(id)sender {
    [self returnMenu];
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"MoreSettings"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

- (void)returnMenu
{
    HomeRootView *rootView=(HomeRootView *)[self superview];
    [rootView _showMenu];
}

-(BOOL)isLogout
{
    return logout;
}

- (void)dealloc
{
    NSLog(@"dealloc home menu view");
}

@end
