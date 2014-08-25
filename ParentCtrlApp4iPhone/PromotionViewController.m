//
//  PromotionViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-21.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "PromotionViewController.h"

@interface PromotionViewController ()

@end

@implementation PromotionViewController

- (IBAction)next:(id)sender {
    [ApplicationContext gotoState:@"Login" params:nil];
}
@end
