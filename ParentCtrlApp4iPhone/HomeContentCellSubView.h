//
//  HomeContentCellSubView.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-25.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeContentTableViewCell.h"

//也许必须有一个CellSubView，没有想到更好的办法，和之前的版本比较，这是将table delegate/datasouce转移到controller的代价？

@class HomeContentTableViewCell;

@interface HomeContentCellSubView : UIView

@property (weak, nonatomic)  HomeContentTableViewCell *cell;

@end
