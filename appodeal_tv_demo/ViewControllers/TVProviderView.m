//
//  TVProviderView.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 04/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVProviderView.h"
#import "Masonry.h"

@interface TVProviderView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TVProviderView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        
        [self addSubview:self.tableView];
    }
    [self updateConstraints];
    return self;
}

-(void) updateConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(-70);
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self);
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

#pragma mark --- TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.delegateTVProvider tvTableView:tableView numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellName = NSStringFromClass([self class]);
    TVProviderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[TVProviderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.focusStyle = UITableViewCellFocusStyleCustom;
    }
    
    cell = [self.delegateTVProvider tvTableView:tableView cell:cell ForRowAtIndexPath:indexPath];
    
    [cell.contentView setNeedsUpdateConstraints];
    [cell.contentView updateConstraintsIfNeeded];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegateTVProvider tvTableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    context.nextFocusedView.backgroundColor = UIColor.whiteColor;
    context.previouslyFocusedView.backgroundColor = UIColor.clearColor;
    
    [context.nextFocusedView viewWithTag:999].alpha = 1.0f;
    [context.previouslyFocusedView viewWithTag:999].alpha = 0.0f;
    
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

@end
