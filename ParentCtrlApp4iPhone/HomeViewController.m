//
//  HomeViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-17.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

int kHomeViewCellHeight=110;

#import "HomeViewController.h"
#import "HomeContentTableViewCell.h"
#import "HomeContentCellSubView.h"

//#import "HomeMenuView.h"

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //加载menuview和MaskView
    rootView=(HomeRootView *)self.view;
    [rootView loadSubviews];
    
    //创建tableview
    [self createTableView];
}

/**
 * 以下为menuview支持方法
 */

//找回已删设备
- (IBAction)findDevice:(id)sender {
    [rootView closeMenu];
    [ApplicationContext gotoState:@"FindDevice" params:nil];
}

//家长意见簿
- (IBAction)parentAdvise:(id)sender {
    [rootView closeMenu];
    [ApplicationContext gotoState:@"ParentAdvise" params:nil];
}

//App版本（关于）
- (IBAction)about:(id)sender {
    [rootView closeMenu];
    [ApplicationContext gotoState:@"About" params:nil];
}

//更多设置
- (IBAction)moreSettings:(id)sender {
    [rootView closeMenu];
    [ApplicationContext gotoState:@"MoreSettings" params:nil];
}

//退出账号
- (IBAction)logout:(id)sender {
    [rootView closeMenu];
    [ApplicationContext gotoState:@"Login" params:nil];
    isLogout=YES;
}

/**
 * 有关tableview的方法
 */

-(void)createTableView
{
    [[ApplicationContext sharedContext] getDevicesInfoWithTheRouter:nil                                                                 success:^(NSMutableArray *data){
        deviceInfoArray=data;
        
        tableView=[[HomeContentTableView alloc] initWithFrame:contentView.bounds];
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor=[UIColor yellowColor];
        tableView.dataSource=self;
        tableView.delegate=self;
        
        [contentView addSubview:tableView];
    }error:^(NSError * error) {
        NSLog(@"error: %@",error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [deviceInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"deviceInfocell";
    
    HomeContentTableViewCell *cell = (HomeContentTableViewCell *)[_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HomeContentTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.tableView=tableView;
    }
    
    [cell initWithData:[deviceInfoArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHomeViewCellHeight;
}

- (void)tableView:(UITableView *)_tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [((HomeContentTableViewCell *)cell) addObservers];
}

- (void)tableView:(UITableView *)_tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView removeObserver:cell forKeyPath:@"scrollEnabled"];
}

//删除指定的cell
- (IBAction)deleteCell:(id)sender {
    HomeContentTableViewCell *cell=((HomeContentCellSubView *)(((UIView *)sender).superview)).cell;
    [cell closeBottomView];
    
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];

    [tableView beginUpdates];
    [deviceInfoArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                        withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
    
    tableView.scrollEnabled=YES;
}

//主要是释放tableview的资源
- (void)viewWillDisappear:(BOOL)animated
{
    //如果没有logout，controller不必销毁
    if (!isLogout) {
        return;
    }
    
    //移除cell中的kvo
    if (tableView) {
        for (HomeContentTableViewCell *cell in tableView.visibleCells){
            [cell removeObservers];
        }
    }
}

-(void)dealloc
{
    NSLog(@"dealloc home view controller");
}
@end
