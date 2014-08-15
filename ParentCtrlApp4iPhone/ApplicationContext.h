//
//  ApplicationContext.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

//test kvo
#import "KvoDemo.h"

@interface ApplicationContext : NSObject

{
    //test kvo
    KvoDemo *k;
}

+ (id)sharedContext;

-(void) testAFNetworkAPI;


@end
