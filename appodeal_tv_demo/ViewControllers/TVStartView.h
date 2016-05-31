//
//  TVStartView.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TVStartViewDelegate <NSObject>
@optional

-(void)appodealButtonClick:(id) sender;

@end

@interface TVStartView : UIView

@property (nonatomic, strong) UILabel * timerLabel;
@property (nonatomic, weak) id <TVStartViewDelegate> delegateTVStart;

@end
