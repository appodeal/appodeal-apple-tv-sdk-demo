//
//  TVStartViewController.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVStartViewController.h"
#import "TVStartView.h"

@interface TVStartViewController () <TVStartViewDelegate>
{
    TVStartView * startView;
    NSTimer * timer;
    
    CGFloat maxTimer;
    CGFloat currentTimer;
}
@end

@implementation TVStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        startView = [[TVStartView alloc] initWithFrame:self.view.frame];
        startView.delegateTVStart = self;
        self.view = startView;
    }
    {
        maxTimer = 3.0f;
        currentTimer = 0.0f;
        [self timerStart];
    }
}

- (void) timerStart {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
}

- (void) timerTick {
    if (currentTimer < maxTimer - 0.1) {
        currentTimer += 0.1;
        startView.timerLabel.text = [NSString stringWithFormat:@"%0.1f", maxTimer - currentTimer];
    } else {
        startView.timerLabel.text = @"Start";
        [self dismissViewControllerAnimated:YES completion:nil];
        [timer invalidate];
        timer = nil;
    }
}

- (void)appodealButtonClick:(id)sender{
//    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
