//
//  HomeContentTableViewCell.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DeviceInfo.h"
#import "HomeContentTableView.h"


@class HomeContentCellSubView;

@interface HomeContentTableViewCell : UITableViewCell
{
    CGPoint panStartPoint;
    float startViewX;
    CGRect startFrame,endFrame;
    __weak IBOutlet UIView *frontView;
    __weak IBOutlet UIScrollView *scrollView;
    BOOL opened, stopped, hasAddScrollEnableKvo;
    
    __weak IBOutlet UIView *backView;
    
    __weak IBOutlet HomeContentCellSubView *frontContentView;
    __weak IBOutlet HomeContentCellSubView *backContentView;
//    DeviceInfo *deviceInfo;
}
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *useButton;

@property (weak, nonatomic)HomeContentTableView *tableView;

-(void) initWithData:(DeviceInfo *)info;

//-(void) removeDeviceObserver;

//重构使用的新方法
-(void) closeBottomView;
-(void) addObservers;
-(void) removeObservers;


@end
