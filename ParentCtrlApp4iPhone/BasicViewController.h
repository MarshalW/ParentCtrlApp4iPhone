//
//  BasicViewController.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ApplicationContext.h"

@interface BasicViewController : UIViewController

{
    float contentStartY,contentEndY;
    
    __weak IBOutlet UIView *headerView;
    __weak IBOutlet UIView *footerView;
    __weak IBOutlet UIView *contentView;
}

@end
