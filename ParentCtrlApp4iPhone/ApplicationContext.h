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
    //成功的block
    void (^_completionHandler)(NSArray  *data);
    //错误的block
    void (^_errorHandler)(NSError  *error);
    
    //test kvo
//    KvoDemo *k;
}

+ (id)sharedContext;

//获取该路由下的设备信息数组
- (void) getDevicesInfoWithTheRouter:(NSDictionary *)params  success:(void(^)(NSArray *))sucessHandler error:(void(^)(NSError *))errorHandler;


@end
