//
//  AppDelegate.h
//  appodeal_tv_demo
//
//  Created by Lozhkin Ilya on 5/31/16.
//  Copyright © 2016 Lozhkin Ilya. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PROVIDERS                   @[@"vast",@"applovin",@"spotx"]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) UINavigationController * startNavigation;
@property (nonatomic, strong) UINavigationController * mainNavigation;

- (void) initAppodealProvider:(NSArray *)provider rewardAutoCache:(BOOL)rewardAutoCache skippableAutoCache:(BOOL)skippableAutoCache testMode:(BOOL)testMode;


@end

