//
//  ApplicationContext.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ApplicationContext.h"

#import "DeviceInfo.h"

#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"

#import <OHHTTPStubs/OHHTTPStubs.h>

@implementation ApplicationContext

//单例
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
//        hasReadPromotion=YES;
        [self initMockHttpInfo];
    }
    return self;
}

//初始化mock http信息
-(void)initMockHttpInfo
{
    //test
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [[request.URL absoluteString] isEqualToString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSString* fixture = OHPathForFileInBundle(@"test.json",nil);
        return [[OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                 statusCode:200 headers:@{@"Content-Type":@"text/json"}
                 ]requestTime:1.0 responseTime:1.0];//模拟延时2秒
    }];
}

-(void)login:(NSDictionary *)params  success:(void(^)())sucessHandler error:(void(^)(NSError *))errorHandler
{
    void (^_completionHandler)()=[sucessHandler copy];
    hasLogin=YES;
    _completionHandler();
}

-(BOOL)hasBond
{
    return hasBond;
}


-(void)logout
{
    hasLogin=NO;
}

- (void) getDevicesInfoWithTheRouter:(NSDictionary *)params  success:(void(^)(NSMutableArray *))sucessHandler error:(void(^)(NSError *))errorHandler
{
    NSMutableArray *array=[NSMutableArray new];
    
    static BOOL chooseFirstOrSecond=YES;

    //模拟从服务器端获取的设备信息数据
    
    if(chooseFirstOrSecond){
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:1]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:10]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:22]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:27]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:11]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:31]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:4]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:17]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:9]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:16]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:14]];
    }else{
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:10]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:14]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:10]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:12]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:8]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:7]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:3]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:22]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:18]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:19]];
        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:7]];
    }
    
    chooseFirstOrSecond=!chooseFirstOrSecond;

    for (int i=0; i<array.count; i++) {
        DeviceInfo *d=(DeviceInfo *)[array objectAtIndex:i];
        d.rid+=i;
    }
    
    //成功的block
    void (^_completionHandler)(NSMutableArray  *data);
    //错误的block
    void (^_errorHandler)(NSError  *error);
    
    _completionHandler = [sucessHandler copy];
    _errorHandler=[errorHandler copy];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://alpha-api.app.net/stream/0/posts/stream/global" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        _completionHandler(array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        _errorHandler(error);
    }];
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
//    NSLog(@"observe .. ok!");
}

- (NSString *) getStartState
{
    if (!hasLogin && !hasReadPromotion) {
        return @"Promotion";
    }
    
    if (!hasLogin) {
        return @"Login";
    }
    
    return @"Home";
}


@end
