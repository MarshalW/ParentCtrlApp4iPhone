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

@interface HomeContentTableViewCell : UITableViewCell
{
    CGPoint panStartPoint;
    float startViewX;
    CGRect startFrame,endFrame;
    __weak IBOutlet UIView *tagView,*frontView;
    __weak IBOutlet UIScrollView *scrollView;
    BOOL opened, stopped, hasAddScrollEnableKvo;
    
//    __weak HomeContentTableView *tableView;
    
    DeviceInfo *deviceInfo;
}
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *useButton;

@property (weak, nonatomic)HomeContentTableView *tableView;

-(void) initWithData:(DeviceInfo *)info;

-(void) removeDeviceObserver;

@end
