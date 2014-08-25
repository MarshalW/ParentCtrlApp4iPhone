//
//  MailSignUpView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-24.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "MailSignUpView.h"

@implementation MailSignUpView

- (void)didMoveToSuperview
{
    webView=[[UIWebView alloc]initWithFrame:self.bounds];
    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:url];
    [webView loadRequest:nsrequest];
    [self addSubview:webView];
    
    webView.delegate=self;
}

//这个方法将来可用于监控302请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"should start load with request: %@",request);
    return YES;
}

@end
