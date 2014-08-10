//
//  HomeFooterView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeFooterView.h"
#import "BasicViewController.h"

@implementation HomeFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

//测试
- (IBAction)nextStep:(id)sender
{
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"ContentList"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

@end
