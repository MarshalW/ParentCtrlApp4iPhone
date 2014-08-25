//
//  DemoViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-23.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "DemoViewController.h"


@implementation DemoViewController

//绑定路由按钮的处理
- (IBAction)bindRouter:(id)sender {
    [ApplicationContext gotoState:@"BindRouter" params:nil];
}

//点击任何操作，进入绑定路由器状态
- (IBAction)anyAction:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.message = @"更多操作请绑定路由器";
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        [ApplicationContext gotoState:@"BindRouter" params:nil];
    }
}



@end
