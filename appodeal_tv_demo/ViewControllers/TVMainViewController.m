//
//  TVMainViewController.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVMainViewController.h"
#import "TVMainView.h"

#import "AppDelegate.h"
#import "Masonry.h"

#import "Appodeal.h"

@interface TVMainViewController ()<AppodealVideoDelegate ,AppodealRewardedVideoDelegate, TVMainViewDelegate>
{
    TVMainView * mainView;
    
    BOOL _rewardAutoCache;
    BOOL _skippableAutoCache;
    BOOL _testMode;
    
    NSArray * _provider;
}

@end

@implementation TVMainViewController

- (instancetype) initAppodealProvider:(NSArray *)provider rewardAutoCache:(BOOL)rewardAutoCache skippableAutoCache:(BOOL)skippableAutoCache testMode:(BOOL)testMode{
    self = [super init];
    if (self) {
        
        _rewardAutoCache = rewardAutoCache;
        _skippableAutoCache = skippableAutoCache;
        _testMode = testMode;
        _provider = provider;
        
        [Appodeal setTestingEnabled:testMode];
        
        [self disableAppodealNetwork];
        
        [Appodeal setAutocache:rewardAutoCache types:AppodealAdTypeRewardedVideo];
        [Appodeal setAutocache:skippableAutoCache types:AppodealAdTypeSkippableVideo];
        
        
        [Appodeal initializeWithApiKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppodealAppKey"]
                                 types:AppodealAdTypeRewardedVideo | AppodealAdTypeSkippableVideo];
        
        [Appodeal setRewardedVideoDelegate:self];
        [Appodeal setVideoDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        mainView = [[TVMainView alloc] initWithFrame:self.view.frame];
        mainView.delegateTVMainView = self;
        self.view = mainView;
        
        if (!_skippableAutoCache) {
            [mainView skippableDisableAutoCacheMode];
        } else {
            [mainView skippableEnableAutoCacheMode];
        }
        
        if (!_rewardAutoCache) {
            [mainView rewardDisableAutoCacheMode];
        } else {
            [mainView rewardEnableAutoCacheMode];
        }
    }
}

#pragma mark --- Method

- (void) userSettings{
    
    [Appodeal setUserId:@"1234"];
    [Appodeal setUserVkId:@"34536"];
    [Appodeal setUserFacebookId:@"234234"];
    [Appodeal setUserEmail:@"sdd@mail.ru"];
    [Appodeal setUserBirthday:[NSDate date]];
    [Appodeal setUserAge:22];
    [Appodeal setUserGender:AppodealUserGenderMale];
    [Appodeal setUserOccupation:AppodealUserOccupationWork];
    [Appodeal setUserRelationship:AppodealUserRelationshipSingle];
    [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNeutral];
    [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNeutral];
    [Appodeal setUserInterests:@"interes"];
}

- (void) disableAppodealNetwork {
    NSMutableDictionary * network = [NSMutableDictionary dictionary];
    for (NSString * str in _provider) {
        network[str] = @(1);
    }
    for (NSString * str in PROVIDERS) {
        network[str] = network[str] ? nil : @(1);
    }
    
    for (NSString * str in network) {
        [Appodeal disableNetworkForAdType:AppodealAdTypeRewardedVideo | AppodealAdTypeSkippableVideo name:str];
    }
    
    return;
}

#pragma mark --- DELEGATE

- (void) tvRewardVideo:(id)sender{
    if (![Appodeal isReadyForShowWithStyle:AppodealShowStyleRewardedVideo]) {
        [Appodeal cacheAd:AppodealAdTypeRewardedVideo];
        return;
    }
    AppodealShowStyle style = AppodealShowStyleRewardedVideo;
    [Appodeal showAd:style rootViewController:self];
}

- (void) tvSkippblVideo:(id)sender{
    if (![Appodeal isReadyForShowWithStyle:AppodealShowStyleSkippableVideo]) {
        [Appodeal cacheAd:AppodealAdTypeSkippableVideo];
        return;
    }
    AppodealShowStyle style = AppodealShowStyleSkippableVideo;
    [Appodeal showAd:style rootViewController:self];
}

#pragma mark --- REVARDED VIDEO DELEGATE

- (void)rewardedVideoDidLoadAd{
    NSLog(@"REWARDED VIDEO DOWNLOADED");
    if (!_rewardAutoCache) {
        [mainView rewardEnableAutoCacheMode];
    }
}

- (void)rewardedVideoDidFailToLoadAd{
    NSLog(@"REWARDED VIDEO DID FAIL");
    [Appodeal cacheAd:AppodealAdTypeRewardedVideo];
}

- (void)rewardedVideoDidPresent{
    [mainView rewardDisableAutoCacheMode];
    NSLog(@"REWARDED VIDEO PRESENT");
    
    [self userSettings];
}

- (void)rewardedVideoWillDismiss{
    NSLog(@"REWARDED VIDEO DISMISS");
}

- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName{
    NSLog(@"REWARDED VIDEO DID FINISH");
}

- (void) rewardedVideoDidClick{
    NSLog(@"REWARDED VIDEO DID CLICK");
}

#pragma mark --- SKIPPABLE_VIDEO_DELEGATE

- (void)videoDidLoadAd{
     NSLog(@"SKIPPABLE VIDEO DID LOAD AD");
    [mainView skippableEnableAutoCacheMode];
}

- (void)videoDidFailToLoadAd{
     NSLog(@"SKIPPABLE VIDEO DID FAIL TO LOAD");
    if (!_skippableAutoCache) {
        [Appodeal cacheAd:AppodealAdTypeSkippableVideo];
    }
}

- (void)videoDidPresent{
     NSLog(@"SKIPPABLE VIDEO DID PRESENT");
    [mainView skippableDisableAutoCacheMode];
}

- (void)videoWillDismiss{
     NSLog(@"SKIPPABLE VIDEO WILL DISMISS");
}

- (void)videoDidFinish{
     NSLog(@"SKIPPABLE VIDEO DID FINISH");
}

- (void)videoDidClick{
    NSLog(@"SKIPPABLE VIDEO DID CLICK");
}


@end
