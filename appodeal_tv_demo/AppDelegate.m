//
//  AppDelegate.m
//  appodeal_tv_demo
//
//  Created by Lozhkin Ilya on 5/31/16.
//  Copyright © 2016 Lozhkin Ilya. All rights reserved.
//

#import "AppDelegate.h"
#import "TVMainViewController.h"
#import "TVStartViewController.h"
#import "TVInitViewController.h"

#import <Appodeal/Appodeal.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    [self createStartSection];
    
    return YES;
}

- (void) createStartSection {
    TVStartViewController * startController = [TVStartViewController new];
    TVInitViewController * initController = [TVInitViewController new];
    
    self.startNavigation = [[UINavigationController alloc] initWithRootViewController:initController];
    self.window.rootViewController = self.startNavigation;
    
    [self.startNavigation presentViewController:startController animated:NO completion:nil];
}

- (void) initAppodealProvider:(NSArray *)provider rewardAutoCache:(BOOL)rewardAutoCache skippableAutoCache:(BOOL)skippableAutoCache testMode:(BOOL)testMode{
    TVMainViewController * mainController = [[TVMainViewController alloc] initAppodealProvider:provider
                                                                               rewardAutoCache:rewardAutoCache
                                                                            skippableAutoCache:skippableAutoCache
                                                                                      testMode:testMode];
    
    self.mainNavigation = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = self.mainNavigation;
}


///////////////////////////////////////////////////////////////////////////////

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
