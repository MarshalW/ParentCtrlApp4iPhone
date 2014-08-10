//
//  FindDeviceFooterView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "FindDeviceFooterView.h"

@implementation FindDeviceFooterView

- (IBAction)goBack:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backward" object:self];
}

@end
