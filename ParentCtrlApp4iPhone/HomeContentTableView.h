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
    NSMutableArray *deviceInfoArray;
    NSString * timestamp;
}

- (id)initWithFrame:(CGRect)frame deviceInfoArray:(NSMutableArray *) array;

-(void) removeDevice:(int)index;

@end
