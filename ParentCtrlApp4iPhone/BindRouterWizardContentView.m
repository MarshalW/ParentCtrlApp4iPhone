//
//  BindRouterWizardContentView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BindRouterWizardContentView.h"

@implementation BindRouterWizardContentView

- (IBAction)addRouter:(id)sender {
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"BindRouter"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}


- (IBAction)unbindRouter:(id)sender {
    NSDictionary *d = [NSDictionary dictionaryWithObject:@"BindRouter"
                                                  forKey:@"state"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

@end
