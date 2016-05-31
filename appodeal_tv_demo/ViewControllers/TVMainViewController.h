//
//  TVMainViewController.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVMainViewController : UIViewController

- (instancetype) initAppodealProvider:(NSArray *)provider rewardAutoCache:(BOOL)rewardAutoCache skippableAutoCache:(BOOL)skippableAutoCache testMode:(BOOL)testMode;

@end
