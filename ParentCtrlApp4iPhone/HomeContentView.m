//
//  HomeContentView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentView.h"
#import "HomeContentTableView.h"

@implementation HomeContentView

- (void)LoadContent
{
    [self initContentSubview];
}

-(void)initContentSubview
{
    contentSubview=[[UIView alloc] initWithFrame:self.bounds];
    [self loadData];
}

//模拟从网络获取数据
-(void)loadData
{
//    NSLog(@"load data");
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(_loadData:)
                                   userInfo:nil
                                    repeats:NO];
}

-(void) _loadData:(NSTimer*) timer
{
//    NSLog(@"_load data");
    [self loadContentSubviews];
    [timer invalidate];
}

//加载内容子视图
-(void) loadContentSubviews
{
    contentSubview.backgroundColor=[UIColor lightGrayColor];
    [self addSubview:contentSubview];
    
    HomeContentTableView *tableView=[[HomeContentTableView alloc] initWithFrame:contentSubview.bounds];
    tableView.backgroundColor=[UIColor yellowColor];
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [contentSubview addSubview:tableView];
    
//    NSLog(@"load subviews");
}

@end
