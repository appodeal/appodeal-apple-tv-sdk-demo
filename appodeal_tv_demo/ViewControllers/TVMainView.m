//
//  TVMainView.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVMainView.h"
#import "UIImage+Additions.h"
#import "Masonry.h"


@interface TVMainView ()
{
    
}
@end

@implementation TVMainView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.showRewardVideoBtn];
        [self addSubview:self.showSkipblVideoBtn];
    }
    [self createConstrain];
    
    return self;
}

-(void) createConstrain{

    [self.showRewardVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).with.offset(-20);
        make.bottom.equalTo(self.mas_centerY).with.offset(-20);
    }];
    
    [self.showSkipblVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).with.offset(20);
        make.bottom.equalTo(self.mas_centerY).with.offset(-20);
    }];
}

#pragma mark --- Property

-(UIButton *) showRewardVideoBtn {
    if (!_showRewardVideoBtn) {
        _showRewardVideoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _showRewardVideoBtn.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
        [_showRewardVideoBtn setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3]] forState:UIControlStateNormal];
        [_showRewardVideoBtn setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7]] forState:UIControlStateFocused];
        [_showRewardVideoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_showRewardVideoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateFocused];
        [_showRewardVideoBtn setBackgroundColor:UIColor.clearColor];
        _showRewardVideoBtn.tag = 99;
        _showRewardVideoBtn.enabled = YES;
        [_showRewardVideoBtn addTarget:self action:@selector(showRewardVideoClick:) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
    return _showRewardVideoBtn;
}

-(UIButton *) showSkipblVideoBtn {
    if (!_showSkipblVideoBtn) {
        _showSkipblVideoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _showSkipblVideoBtn.titleLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
        [_showSkipblVideoBtn setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3]] forState:UIControlStateNormal];
        [_showSkipblVideoBtn setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7]] forState:UIControlStateFocused];
        [_showSkipblVideoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_showSkipblVideoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateFocused];
        [_showSkipblVideoBtn setBackgroundColor:UIColor.clearColor];
        _showSkipblVideoBtn.tag = 99;
        _showSkipblVideoBtn.enabled = YES;
        [_showSkipblVideoBtn addTarget:self action:@selector(showSkippableVideoClick:) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
    return _showSkipblVideoBtn;
}

#pragma mark --- PUBLICK

-(void) rewardDisableAutoCacheMode{
    [_showRewardVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"cache reward video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.blackColor}]
                                   forState:UIControlStateNormal];
    [_showRewardVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"cache reward video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.whiteColor}]
                                   forState:UIControlStateFocused];
}

-(void) skippableDisableAutoCacheMode{
    [_showSkipblVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"cache skippable Video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.blackColor}]
                                   forState:UIControlStateNormal];
    [_showSkipblVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"cache skippable Video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.whiteColor}]
                                   forState:UIControlStateFocused];

}

-(void) rewardEnableAutoCacheMode{
    [_showRewardVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"show reward video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.blackColor}]
                                   forState:UIControlStateNormal];
    [_showRewardVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"show reward video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.whiteColor}]
                                   forState:UIControlStateFocused];
}

-(void) skippableEnableAutoCacheMode{
    [_showSkipblVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"show skippable Video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.blackColor}]
                                   forState:UIControlStateNormal];
    [_showSkipblVideoBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:[NSLocalizedString(@"show skippable Video", nil) uppercaseString] attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:22], NSKernAttributeName : @(6.0), NSForegroundColorAttributeName : UIColor.whiteColor}]
                                   forState:UIControlStateFocused];
    
}

#pragma mark --- Actions

- (IBAction)showRewardVideoClick:(id)sender{
    [self.delegateTVMainView tvRewardVideo:sender];
}

- (IBAction)showSkippableVideoClick:(id)sender{
    [self.delegateTVMainView tvSkippblVideo:sender];
}

- (void) didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
    if ([context.nextFocusedView viewWithTag:99]) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.nextFocusedView.transform = CGAffineTransformMakeScale(1.3, 1.3);
            context.nextFocusedView.layer.shadowColor = [UIColor clearColor].CGColor;
            
        } completion:nil];
        
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.previouslyFocusedView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            context.previouslyFocusedView.layer.shadowColor = [UIColor clearColor].CGColor;
            
        } completion:nil];
    }
}

@end
