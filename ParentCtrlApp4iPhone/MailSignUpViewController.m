//
//  MailSignUpViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "MailSignUpViewController.h"

@interface MailSignUpViewController ()

@end

@implementation MailSignUpViewController


- (IBAction)gotoLogin:(id)sender {
    [ApplicationContext gotoState:@"Login" params:nil];
}
@end
