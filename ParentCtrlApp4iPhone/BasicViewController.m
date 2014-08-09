//
//  BasicViewController.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (IS_IPHONE_5) {
        CGRect rect=self.view.frame;
        rect.size.height+=88;
        [self.view setFrame:rect];
    }
    
    if (headerView) {
        [self.view addSubview:headerView];
        contentStartY=headerView.frame.size.height;
    }
    
    if (footerView) {
        contentEndY=self.view.frame.size.height-footerView.frame.size.height;
        footerView.frame=CGRectMake(0, contentEndY, footerView.frame.size.width, footerView.frame.size.height);
        [self.view addSubview:footerView];
    }
    
    if (contentView) {
        contentView.frame=CGRectMake(0, contentStartY, contentView.frame.size.width, contentView.frame.size.height);
        [self.view addSubview:contentView];
    }
}


@end
