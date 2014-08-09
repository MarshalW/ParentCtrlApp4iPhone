//
//  ContentListHeaderView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ContentListHeaderView.h"

@implementation ContentListHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (IBAction)backStep:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backward" object:self];
}

@end
