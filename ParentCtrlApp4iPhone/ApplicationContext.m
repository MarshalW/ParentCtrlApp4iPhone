//
//  ApplicationContext.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ApplicationContext.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"

#import <OHHTTPStubs/OHHTTPStubs.h>




@implementation ApplicationContext

+ (id)sharedContext {
    static ApplicationContext *sharedContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedContext = [[self alloc] init];
    });
    return sharedContext;
}



- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void) testAFNetworkAPI
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [[request.URL absoluteString] isEqualToString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        // Stub it with our "wsresponse.json" stub file
        NSString* fixture = OHPathForFileInBundle(@"test.json",nil);
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                statusCode:200 headers:@{@"Content-Type":@"text/json"}];
    }];
    
//    [OHHTTPStubs setEnabled:NO];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://alpha-api.app.net/stream/0/posts/stream/global" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    k=[[KvoDemo alloc] init];
    [k addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [k setValue:@"John" forKeyPath:@"userName"];
    NSLog(@"kvo demo, user name: %@",[k valueForKeyPath:@"userName"]);
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    NSLog(@"observe .. ok!");
}


@end
