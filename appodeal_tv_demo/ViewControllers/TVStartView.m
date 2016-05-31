//
//  TVStartView.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVStartView.h"

#import "Masonry.h"

@interface TVStartView ()

@property (nonatomic, strong) UIButton * appodealButton;
@property (nonatomic, strong) UIImageView * backgroundImage;

@end

@implementation TVStartView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        
        [self addSubview:self.appodealButton];
        [self addSubview:self.backgroundImage];
        [self addSubview:self.timerLabel];
    }
    [self updateConstraints];
    return self;
}

-(void) updateConstraints {
    
    [self.appodealButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    
    [self.timerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@50);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-10);
    }];
    
    [super updateConstraints];
}

#pragma mark --- Property

-(UIButton *) appodealButton {
    if (!_appodealButton) {
        _appodealButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_appodealButton setBackgroundImage:[UIImage add_resizableImageWithColor:YellowMainColor] forState:UIControlStateNormal];
//        [_appodealButton setBackgroundImage:[UIImage add_resizableImageWithColor:YellowLightColor] forState:UIControlStateHighlighted];
        _appodealButton.layer.cornerRadius = 30.0f;
        [_appodealButton setTitle:@"A" forState:UIControlStateNormal];
        [_appodealButton setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5]];
        [_appodealButton addTarget:self action:@selector(appodealClick:) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
    return _appodealButton;
}

-(UIImageView *) backgroundImage {
    if (!_backgroundImage) {
        _backgroundImage = [[UIImageView alloc] initWithFrame:self.frame];
        _backgroundImage.image = [UIImage imageNamed:@"LaunchImage"];
    }
    return _backgroundImage;
}

- (UILabel *) timerLabel {
    if (!_timerLabel) {
        _timerLabel = [UILabel new];
        _timerLabel.textColor = UIColor.whiteColor;
        _timerLabel.font = [UIFont systemFontOfSize:24.0f weight:UIFontWeightMedium];
        _timerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timerLabel;
}

#pragma mark --- Actions

-(IBAction)appodealClick:(id)sender{
    [self.delegateTVStart appodealButtonClick:sender];
}

@end
