//
//  ApplicationContext.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

//test kvo
//#import "KvoDemo.h"

@interface ApplicationContext : NSObject

{
    //临时变量
    BOOL hasReadPromotion;
    BOOL hasLogin;
    BOOL hasBond;
}

+ (id)sharedContext;

//获取该路由下的设备信息数组
- (void) getDevicesInfoWithTheRouter:(NSDictionary *)params  success:(void(^)(NSMutableArray *))sucessHandler error:(void(^)(NSError *))errorHandler;

- (NSString *) getStartState;


//临时性的，用于架构说明
-(void)login:(NSDictionary *)params  success:(void(^)())sucessHandler error:(void(^)(NSError *))errorHandler;

-(void)logout;

-(BOOL)hasBond;

@end
