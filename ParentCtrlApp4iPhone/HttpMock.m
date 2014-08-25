//
//  HttpMock.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-25.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HttpMock.h"
#import <OHHTTPStubs/OHHTTPStubs.h>

@implementation HttpMock


+ (void) initMock
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [[request.URL absoluteString] isEqualToString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSString* fixture = OHPathForFileInBundle(@"test.json",nil);
        return [[OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                 statusCode:200 headers:@{@"Content-Type":@"text/json"}
                 ]requestTime:1.0 responseTime:1.0];//模拟延时2秒
    }];

}

@end
