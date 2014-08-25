//
//  HeaderView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-16.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HeaderView.h"
#import "ApplicationContext.h"

@implementation HeaderView

- (IBAction)goBack:(id)sender {
    [ApplicationContext backwardState];
}

@end
