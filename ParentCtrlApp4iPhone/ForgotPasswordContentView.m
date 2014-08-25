//
//  ForgotPasswordContentView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-22.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ForgotPasswordContentView.h"

@implementation ForgotPasswordContentView

- (void)didMoveToSuperview
{
    webView=[[UIWebView alloc]initWithFrame:self.bounds];
    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:url];
    [webView loadRequest:nsrequest];
    [self addSubview:webView];
}

@end
