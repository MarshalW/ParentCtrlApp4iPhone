//
//  ApplicationContext.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-10.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ApplicationContext.h"

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

@end
