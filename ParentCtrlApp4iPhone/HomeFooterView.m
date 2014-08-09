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

- (IBAction)nextStep:(id)sender
{
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"ContentListView"
                                                  forKey:@"view"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

@end
