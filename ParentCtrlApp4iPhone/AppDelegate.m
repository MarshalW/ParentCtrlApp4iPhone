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
    
    //获取初始的状态
    NSString *startState=[[ApplicationContext sharedContext] getStartState];

    //根据初始状态，获得viewController实例
    UIViewController *viewController=[self getController:startState];
    
    navigationController = [[UINavigationController alloc]
                            initWithRootViewController: viewController];
    navigationController.navigationBar.hidden = YES;
    
    self.window.rootViewController=navigationController;
    [self.window addSubview:navigationController.view];
    
    [self.window makeKeyAndVisible];
    
    //通过通知机制调度和切换各个Controller
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(forwardViewController:) name:@"forward" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backwardViewController:) name:@"backward" object:nil];
    
    return YES;
}

- (void)forwardViewController:(NSNotification *)notification
{
    NSString *stateName=[[notification userInfo] objectForKey:@"state"];
    
    if ([stateName isEqualToString:@"Home"]) {
        //TODO 如果没有登录，到Demo页
        
        //TODO 如果没有绑定过路由，到Demo页
        if (![[ApplicationContext sharedContext] hasBond]) {
            stateName=@"Demo";
        }
    }
    
    BasicViewController *viewController=[self getController:stateName];
    
    if (notification.userInfo) {
        [viewController setParams:notification.userInfo];
    }
    
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

- (BasicViewController *) getController: (NSString *)stateName
{
    NSString * xibName=[NSString stringWithFormat:@"%@ViewController",stateName];
    NSString * controllerClassName=@"BasicViewController";
    
    //如果没有和xib同名的Controller类，就默认用BasicViewController
    Class controllerClass=NSClassFromString(xibName);
    if (controllerClass) {
        controllerClassName=xibName;
    }
    
   return [[NSClassFromString(controllerClassName) alloc] initWithNibName:xibName bundle:nil];
}

@end
