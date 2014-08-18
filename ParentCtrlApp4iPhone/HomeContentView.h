//
//  HomeContentView.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadContent.h"

@interface HomeContentView : UIView

{
    __weak IBOutlet UIView *loadingView;//加载中现实的view
    UIView *contentSubview;//内容view
}

@end
