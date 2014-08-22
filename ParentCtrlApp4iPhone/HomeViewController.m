//
//  HomeViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-17.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeContentView.h"
#import "HomeContentTableView.h"

#import "HomeMenuView.h"

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)dealloc
{
    NSLog(@"dealloc home view controller");
}

- (void)viewWillDisappear:(BOOL)animated
{
    //TODO 更兼容性的写法或者更好的设计
    HomeMenuView *menuView=(HomeMenuView *)[self.view.subviews firstObject];
    
    if (![menuView isLogout]) {
        return;
    }
    
    //TODO 这样写不好，以后改
    UIView *subContentView=(UIView *)[contentView.subviews objectAtIndex:1];
    
    if (subContentView.subviews.count>0) {
        HomeContentTableView *tableView=(HomeContentTableView *)[subContentView.subviews objectAtIndex:0];
        [tableView stop];
    }
}
@end
