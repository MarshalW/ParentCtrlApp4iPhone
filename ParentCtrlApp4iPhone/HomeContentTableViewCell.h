//
//  HomeContentTableViewCell.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeContentTableViewCell : UITableViewCell
{
    CGPoint panStartPoint;
    float startViewX;
    CGRect startFrame,endFrame,startScrollViewFrame,endScrollViewFrame,currentScrollViewFrame;
    __weak IBOutlet UIView *tagView,*frontView;
    __weak IBOutlet UIScrollView *scrollView;
    BOOL opened, stopped;
}
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *useButton;

@end
