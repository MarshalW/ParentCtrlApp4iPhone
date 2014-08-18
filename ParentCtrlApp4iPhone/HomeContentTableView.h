//
//  HomeContentTableView.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeContentTableView : UITableView <UITableViewDelegate , UITableViewDataSource>

{
    NSArray *deviceInfoArray;
}

- (id)initWithFrame:(CGRect)frame deviceInfoArray:(NSArray *) array;

@end
