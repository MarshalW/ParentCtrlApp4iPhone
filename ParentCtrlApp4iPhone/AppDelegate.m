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
    
    [self initRouteMap];
    
    NSString *startState=[self getStartState];

    UIViewController *viewController=[self getController:startState];
    navigationController = [[UINavigationController alloc]
                            initWithRootViewController: viewController];
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
    NSString *stateName=[[notification userInfo] objectForKey:@"state"];
    UIViewController *viewController=[self getController:stateName];
    [navigationController pushViewController:viewController animated:YES];

}

- (void)backwardViewController:(NSNotification *)notification
{
    [navigationController popViewControllerAnimated:YES];
}

- (void) initRouteMap
{
    controllerMap=[[NSMutableDictionary alloc] initWithCapacity:32];
    
    [controllerMap setObject:@"HomeViewController" forKey:@"Home"];
}

- (NSString *) getStartState
{
    BOOL isLogin=YES;//模拟已经登录过
    if (isLogin) {
        return @"Home";
    }
    return @"Login";
}

- (UIViewController *) getController: (NSString *)stateName
{
    NSString *viewName=(NSString *)[controllerMap objectForKey:stateName];
    
    UIViewController *controller=nil;
    
    if (!viewName) {
        controller= [[BasicViewController alloc] initWithNibName:[NSString stringWithFormat:@"%@View",stateName ] bundle:nil];
    }else{
        controller=[[NSClassFromString(@"HomeViewController") alloc] initWithNibName:[NSString stringWithFormat:@"%@View",stateName ] bundle:nil];
    }
    
    return controller;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

@end
