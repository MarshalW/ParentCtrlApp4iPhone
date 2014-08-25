//
//  HomeContentLightTableView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentTableView.h"
#import "HomeContentTableViewCell.h"

@implementation HomeContentTableView

/**
 * 有关touch的方法
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (!self.scrollEnabled) {
        self.scrollEnabled=YES;
        
        for (HomeContentTableViewCell *cell in self.visibleCells) {
            [cell closeBottomView];
        }
    }
}

@end
