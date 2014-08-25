//
//  ApplicationContext.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ApplicationContext.h"

#import "DeviceInfo.h"
#import "HttpMock.h"

#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"

//#import <OHHTTPStubs/OHHTTPStubs.h>

//int testCountForTableView=5;

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

+ (void) gotoState:(NSString *)stateName params:(NSDictionary *)params{
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithObject:stateName
                                                  forKey:@"state"];
    if (params) {
        [d addEntriesFromDictionary:params];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forward" object:self userInfo:d];
}

+ (void)backwardState
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backward" object:self];
}

- (id)init {
    if (self = [super init]) {
//        hasReadPromotion=YES;
        [HttpMock initMock];
    }
    return self;
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

-(void)bindRouter
{
    //TODO 临时，将改为异步调用
    hasBond=YES;
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
    
    //模拟数据变化
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
    
    //模拟数据增
    //TODO bug数据增加的时候tableview有bug，当reloaddata发生在条目左移的状态，scroll不可用
//    for (int i=0; i<testCountForTableView; i++) {
//        [array addObject:[[DeviceInfo alloc] initWithNetworkSpeed:testCountForTableView]];
//    }
//    
//    testCountForTableView++;
    

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
