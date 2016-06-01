# Video Integration
Video ads provide full-screen experiences, commonly incorporating rich media to offer a higher level of interactivity than banner and interstitial ads.
Adding one to your app takes just a few lines of code.

## Prerequisites

Before integrating video ads in your app, you’ll need to go through the steps in our [Getting Started Guide](https://github.com/appodeal/ios-sdk/wiki/Getting-Started) to create an account on Appodeal and integrate the SDK into your project.

## Rewarded (Non-skippable) Video Integration

>_Recommended video type for maximum revenue._

```objective-c
#import "YourViewController.h"
#import <Appodeal/Appodeal.h>

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // show video
    [Appodeal showAd:AppodealShowStyleRewardedVideo rootViewController:self];
}
```

## Rewarded (Non-skippable) Video Delegate Protocol

`AppodealRewardedVideoDelegate ` protocol includes a variety of optional methods that you can use to be notified of events, e.g. when an video ad has successfully loaded, or when an video ad did complete with reward (amount and name can be configured via Appodeal Dashboard).
To handle this events you need implement any of optional methods of `AppodealRewardedVideoDelegate ` protocol.

```objective-c
#import "YourViewController.h"
#import <Appodeal/Appodeal.h>

@interface YourViewController () <AppodealRewardedVideoDelegate>

@end

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // set delegate
    [Appodeal setRewardedVideoDelegate:self];
}

- (void)rewardedVideoDidLoadAd {
     NSLog(@"video ad did load");
}

- (void)rewardedVideoDidFailToLoadAd {
     NSLog(@"video ad failed to load");
}

- (void)rewardedVideoDidPresent {
     NSLog(@"video ad did present");
}

- (void)rewardedVideoWillDismiss {
     NSLog(@"video ad has been closed or dismissed");
}

- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName {
     NSLog(@"video ad has been finished and user should be rewarded with %@ %@", @(rewardAmount), rewardName);
}
```


## Skippable Video Integration

```objective-c
#import "YourViewController.h"
#import <Appodeal/Appodeal.h>

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // show video
    [Appodeal showAd:AppodealShowStyleSkippableVideo rootViewController:self];
}
```

## Skippable Video Delegate Protocol

`AppodealVideoDelegate` protocol includes a variety of optional methods that you can use to be notified of events, e.g. when an video ad has successfully loaded, or when an video ad did complete.
To handle this events you need implement any of optional methods of `AppodealVideoDelegate` protocol.

```objective-c
#import "YourViewController.h"
#import <Appodeal/Appodeal.h>

@interface YourViewController () <AppodealVideoDelegate>

@end

@implementation YourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

     // set delegate
    [Appodeal setVideoDelegate:self];
}

- (void)videoDidLoadAd {
     NSLog(@"video ad did load");
}

- (void)videoDidFailToLoadAd {
     NSLog(@"video ad failed to load");
}

- (void)videoDidPresent {
     NSLog(@"video ad did present");
}

- (void)videoWillDismiss {
     NSLog(@"video ad has been closed or dismissed");
}

- (void)videoDidFinish {
     NSLog(@"video ad has been finished and user should be rewarded");
}
```

If you encounter any issues, do not hesitate to contact our happy support team
at [ios@appodeal.com](mailto:ios@appodeal.com).
