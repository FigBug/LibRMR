//
//  RMRAppDelegate.m
//  Demo
//
//  Created by Roland Rabien on 2013-09-06.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRAppDelegate.h"
#import "RMRMainViewController.h"

@implementation RMRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    RMRMainViewController* mainVC = [[RMRMainViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    self.viewController = mainVC;
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
