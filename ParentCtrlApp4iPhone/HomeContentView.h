//
//  HomeContentView.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadContent.h"

@interface HomeContentView : UIView<LoadContent>

{
    __weak IBOutlet UIView *loadingView;
    UIView *contentSubview;
}

@end
