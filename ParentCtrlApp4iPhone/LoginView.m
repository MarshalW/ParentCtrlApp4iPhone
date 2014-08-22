//
//  LoginView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginView.h"
#import "ApplicationContext.h"

@implementation LoginView

- (IBAction)login:(id)sender {
    NSLog(@"login");
    
    NSMutableDictionary *loginInfo=[[NSMutableDictionary alloc] init];
    [loginInfo setObject:@"zhangsan" forKey:@"userName"];
    [loginInfo setObject:@"1234" forKey:@"password"];
    
    [[ApplicationContext sharedContext] login:loginInfo success:^{
        NSLog(@"login ok!");
        NSDictionary *d = [NSDictionary dictionaryWithObject:@"BindRouter"
                                                      forKey:@"state"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
    } error:^(NSError * error) {
        NSLog(@"error");
    }];
}


@end
