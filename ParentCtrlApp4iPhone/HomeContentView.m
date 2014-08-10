//
//  HomeContentView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentView.h"

@implementation HomeContentView

- (IBAction)action:(id)sender {
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"Management"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

@end
