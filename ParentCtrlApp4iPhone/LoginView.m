//
//  LoginView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (IBAction)login:(id)sender {
    NSLog(@"login");
    
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"BindRouter"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}


@end
