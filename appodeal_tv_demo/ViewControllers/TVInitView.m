//
//  TVInitView.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVInitView.h"

#import "Masonry.h"
#import "UIImage+Additions.h"

@interface TVInitView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TVInitView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        
        [self addSubview:self.tableView];
        [self addSubview:self.bottomButton];
        [self addSubview:self.appKey];
        [self addSubview:self.bundleID];
    }
    [self updateConstraints];
    return self;
}

-(void) updateConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bundleID.mas_top).with.offset(-20);
        make.height.equalTo(@100);
        make.centerX.equalTo(self);;
    }];
    
    [self.appKey mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-20);
        make.centerX.equalTo(self);
    }];
    
    [self.bundleID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.appKey.mas_top).with.offset(-20);
        make.centerX.equalTo(self);
    }];
    
    [super updateConstraints];
}

#pragma mark --- Property

-(UITableView *) tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 40.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (UIButton *) bottomButton {
    if (!_bottomButton) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomButton setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3]] forState:UIControlStateNormal];
        [_bottomButton setBackgroundImage:[UIImage add_resizableImageWithColor: [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7]] forState:UIControlStateFocused];
        [_bottomButton setTitle:@"Initialize SDK" forState:UIControlStateNormal];
        _bottomButton.tag = 33;
        [_bottomButton addTarget:self action:@selector(appodealInit:) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
    return _bottomButton;
}

- (UILabel *) bundleID {
    if (!_bundleID) {
        _bundleID = [UILabel new];
        _bundleID.textColor = UIColor.grayColor;
        _bundleID.textAlignment = NSTextAlignmentCenter;
        _bundleID.font = [UIFont systemFontOfSize:30.0f weight:UIFontWeightBold];
    }
    return _bundleID;
}

- (UILabel *) appKey {
    if (!_appKey) {
        _appKey = [UILabel new];
        _appKey.textColor = UIColor.grayColor;
        _appKey.textAlignment = NSTextAlignmentCenter;
        _appKey.font = [UIFont systemFontOfSize:30.0f weight:UIFontWeightBold];
    }
    return _appKey;
}
#pragma mark --- Actions 

- (IBAction)appodealInit:(id)sender{
    [self.delegateTVInit tvAppodealInitClick:sender];
}

#pragma mark --- TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.delegateTVInit tvTableView:tableView numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellName = NSStringFromClass([self class]);
    TVInitCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[TVInitCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.focusStyle = UITableViewCellFocusStyleCustom;
    }
    
    cell = [self.delegateTVInit tvTableView:tableView cell:cell ForRowAtIndexPath:indexPath];
    
    [cell.contentView setNeedsUpdateConstraints];
    [cell.contentView updateConstraintsIfNeeded];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegateTVInit tvTableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
//    context.nextFocusedView.backgroundColor = UIColor.whiteColor;
//    context.previouslyFocusedView.backgroundColor = UIColor.clearColor;
    
    if ([context.nextFocusedView isKindOfClass:[TVInitCell class]]) {
        ((TVInitCell *)context.nextFocusedView).backgroundColor = UIColor.whiteColor;
    }
    if ([context.previouslyFocusedView isKindOfClass:[TVInitCell class]]) {
        ((TVInitCell *)context.previouslyFocusedView).backgroundColor = UIColor.clearColor;
    }
    
    [context.nextFocusedView viewWithTag:999].alpha = 1.0f;
    [context.previouslyFocusedView viewWithTag:999].alpha = 0.0f;
    
    if ([context.nextFocusedView viewWithTag:33] || [context.previouslyFocusedView viewWithTag:33]) { // for bottomButton
        
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.nextFocusedView.transform = CGAffineTransformMakeScale(1.1, 1.1);

        } completion:nil];
        
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.previouslyFocusedView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            context.previouslyFocusedView.layer.shadowColor = [UIColor lightGrayColor].CGColor;

        } completion:nil];
        
    } else {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.nextFocusedView.transform = CGAffineTransformMakeScale(1.01, 1.01);
            context.nextFocusedView.layer.shadowOffset = CGSizeMake(0, 0);
            context.nextFocusedView.layer.shadowOpacity = 1;
            context.nextFocusedView.layer.shadowRadius = 15;
            context.nextFocusedView.layer.shadowColor = [UIColor redColor].CGColor;
            context.nextFocusedView.layer.shadowOpacity = 1;
            
            
            
        } completion:nil];
        
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.40 initialSpringVelocity:.60 options:UIViewAnimationOptionAllowUserInteraction animations:^ {
            
            context.previouslyFocusedView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            context.previouslyFocusedView.layer.shadowOffset = CGSizeMake(0, 0);
            context.previouslyFocusedView.layer.shadowOpacity = 1;
            context.previouslyFocusedView.layer.shadowRadius = 15;
            context.previouslyFocusedView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
            context.previouslyFocusedView.layer.shadowOpacity = 1;
            
            
        } completion:nil];
    }
}

@end
