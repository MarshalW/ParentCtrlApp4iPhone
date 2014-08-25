//
//  HomeRootView.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeRootView : UIView

{
    BOOL menuShow;
    UIView *maskView;
    __weak IBOutlet UIView *menuView;
}

-(void) _showMenu;

//重构用的新方法
-(void) openMenu;
-(void) closeMenu;
-(void) loadSubviews;

@end
