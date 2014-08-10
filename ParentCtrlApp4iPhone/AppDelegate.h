//
//  AppDelegate.h
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    UINavigationController *navigationController;
    NSMutableDictionary *routeMap;
}

@property (strong, nonatomic) UIWindow *window;

@end
