//
//  TVMainView.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TVMainViewDelegate <NSObject>
@optional

- (void) tvRewardVideo:(id)sender;
- (void) tvSkippblVideo:(id)sender;

@end

@interface TVMainView : UIView

@property (nonatomic, strong) UIButton * showRewardVideoBtn;
@property (nonatomic, strong) UIButton * showSkipblVideoBtn;

@property (nonatomic, strong) id <TVMainViewDelegate> delegateTVMainView;

- (void) skippableDisableAutoCacheMode;
- (void) skippableEnableAutoCacheMode;
- (void) rewardDisableAutoCacheMode;
- (void) rewardEnableAutoCacheMode;

@end
