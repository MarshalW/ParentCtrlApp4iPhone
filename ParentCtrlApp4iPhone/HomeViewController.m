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

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)removeFromParentViewController
{
    [super removeFromParentViewController];
    
    UIView *subContentView=(UIView *)[contentView.subviews objectAtIndex:1];
    
    HomeContentTableView *tableView=(HomeContentTableView *)[subContentView.subviews objectAtIndex:0];
    [tableView stop];
    NSLog(@">>>home view controller: remove from parent view controller");
}

-(void)dealloc
{
    NSLog(@"===>>>>dealloc home view controller");
}

@end
