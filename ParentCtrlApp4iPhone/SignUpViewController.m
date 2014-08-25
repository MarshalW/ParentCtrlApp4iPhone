//
//  SignUpViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController


- (IBAction)signUp:(id)sender {
    //TODO 注册并成功
    
    [ApplicationContext gotoState:@"Login" params:nil];
}
- (IBAction)gotoMailSignUp:(id)sender {
    [ApplicationContext gotoState:@"MailSignUp" params:nil];
}

@end
