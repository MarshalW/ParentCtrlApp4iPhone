//
//  HomeContentView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentView.h"
#import "HomeContentTableView.h"

#import "ApplicationContext.h"


@implementation HomeContentView


- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self initContentSubview];
    }
    return self;
}

-(void)initContentSubview
{
    contentSubview=[[UIView alloc] initWithFrame:self.bounds];
    [self loadData];
}

//加载列表所需的设备数据数组
-(void)loadData
{
    [[ApplicationContext sharedContext] getDevicesInfoWithTheRouter:nil                                                                 success:^(NSArray *data){
        [self loadContentSubviews:data];
    }error:^(NSError * error) {
        NSLog(@"error: %@",error);
    }];
}

//加载内容子视图
-(void) loadContentSubviews:(NSArray *)array
{
    contentSubview.backgroundColor=[UIColor lightGrayColor];
    [self addSubview:contentSubview];
    
    HomeContentTableView *tableView=[[HomeContentTableView alloc] initWithFrame:contentSubview.bounds deviceInfoArray:array];
    tableView.backgroundColor=[UIColor yellowColor];
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [contentSubview addSubview:tableView];
}

@end
