//
//  HomeContentTableViewCell.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DeviceInfo.h"

@interface HomeContentTableViewCell : UITableViewCell
{
    CGPoint panStartPoint;
    float startViewX;
    CGRect startFrame,endFrame;
    __weak IBOutlet UIView *tagView,*frontView;
    __weak IBOutlet UIScrollView *scrollView;
    BOOL opened, stopped;
    
    DeviceInfo *deviceInfo;
}
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *useButton;

-(void) initWithData:(DeviceInfo *)info;

@end
