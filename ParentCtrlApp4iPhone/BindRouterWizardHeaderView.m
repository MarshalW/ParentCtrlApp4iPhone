//
//  BindRouterWizardHeaderView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BindRouterWizardHeaderView.h"

@implementation BindRouterWizardHeaderView

- (IBAction)goBack:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backward" object:self];
}


@end
