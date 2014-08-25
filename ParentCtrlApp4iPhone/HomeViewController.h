//
//  HomeViewController.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-17.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BasicViewController.h"
#import "HomeRootView.h"
#import "HomeContentTableView.h"

@interface HomeViewController : BasicViewController<UITableViewDelegate , UITableViewDataSource>

{
    BOOL isLogout;
    
    //和self.contentView引用同一个对象，为了方法中使用方便，不必转型
    __weak HomeRootView *rootView;
    
    HomeContentTableView *tableView;
    NSMutableArray *deviceInfoArray;
}



@end
