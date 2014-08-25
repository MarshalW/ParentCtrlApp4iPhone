//
//  LoginViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginViewController.h"
#import "ApplicationContext.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

//登录的处理
- (IBAction)login:(id)sender {
    
    NSMutableDictionary *loginInfo=[[NSMutableDictionary alloc] init];
    [loginInfo setObject:@"zhangsan" forKey:@"userName"];
    [loginInfo setObject:@"1234" forKey:@"password"];
    
    [[ApplicationContext sharedContext] login:loginInfo success:^{
        [ApplicationContext gotoState:@"Home" params:loginInfo];
    } error:^(NSError * error) {
        NSLog(@"error");
    }];
}

//忘记密码的处理
- (IBAction)forgotPassword:(id)sender {
    [ApplicationContext gotoState:@"ForgotPassword" params:nil];
}

//注册的处理
- (IBAction)signUp:(id)sender {
    [ApplicationContext gotoState:@"SignUp" params:nil];
}

@end
