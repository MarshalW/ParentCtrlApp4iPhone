//
//  AppDelegate.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "AppDelegate.h"
#import "BasicViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BasicViewController *viewController=[[BasicViewController alloc] initWithNibName:@"HomeView" bundle:nil];
    navigationController = [[UINavigationController alloc]
                            initWithRootViewController:viewController];
    navigationController.navigationBar.hidden = YES;
    
    self.window.rootViewController=navigationController;
    [self.window addSubview:navigationController.view];
    
    [self.window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forwardViewController:) name:@"forward" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backwardViewController:) name:@"backward" object:nil];
    
    return YES;
}

- (void)forwardViewController:(NSNotification *)notification
{
    NSString *viewName=[[notification userInfo] objectForKey:@"view"];
    BasicViewController *viewController=[[BasicViewController alloc] initWithNibName:viewName bundle:nil];
    [navigationController pushViewController:viewController animated:YES];
}

- (void)backwardViewController:(NSNotification *)notification
{
    [navigationController popViewControllerAnimated:YES];
}

@end
