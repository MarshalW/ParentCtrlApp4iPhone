//
//  AppDelegate.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-8.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "AppDelegate.h"
#import "BasicViewController.h"
#import "ApplicationContext.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self initRouteMap];
    
    NSString *startState=[[ApplicationContext sharedContext] getStartState];

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
    
    if ([stateName isEqualToString:@"Login"] ||
        [stateName isEqualToString:@"Home"])
    {
        [self clearOthersViewController];
    }
}

-(void) clearOthersViewController
{
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: navigationController.viewControllers];
    
    if (navigationArray.count>1) {
        for (int i=0; i<navigationArray.count-1; i++) {
            UIViewController *controller=[navigationArray objectAtIndex:i];
            [controller removeFromParentViewController];
        }
        
        UIViewController *controller=[navigationArray lastObject];
        navigationArray=[[NSMutableArray alloc] initWithObjects:controller,nil];
        navigationController.viewControllers =navigationArray;
    }
}

- (void)backwardViewController:(NSNotification *)notification
{
    [navigationController popViewControllerAnimated:YES];
}

- (void) initRouteMap
{
    controllerMap=[[NSMutableDictionary alloc] initWithCapacity:32];
    
    [controllerMap setObject:@"HomeViewController" forKey:@"Home"];
    [controllerMap setObject:@"PromotionViewController" forKey:@"Promotion"];
}

- (UIViewController *) getController: (NSString *)stateName
{
    NSString *viewName=(NSString *)[controllerMap objectForKey:stateName];
    
    UIViewController *controller=nil;
    
    if (!viewName) {
        controller= [[BasicViewController alloc] initWithNibName:[NSString stringWithFormat:@"%@View",stateName ] bundle:nil];
    }else{
        controller=[[NSClassFromString([NSString stringWithFormat:@"%@ViewController",stateName]) alloc] initWithNibName:[NSString stringWithFormat:@"%@View",stateName ] bundle:nil];
        //TODO 这里逻辑有点问题，controllerMap的value没有用起来。
    }
    
    return controller;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

@end
