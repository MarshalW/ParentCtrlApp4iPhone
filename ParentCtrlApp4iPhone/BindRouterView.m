//
//  BindRouterView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BindRouterView.h"

@implementation BindRouterView

- (IBAction)bindRouter:(id)sender {
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"Home"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

@end
