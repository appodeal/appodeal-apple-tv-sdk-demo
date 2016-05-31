//
//  TVInitView.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVInitCell.h"

@protocol TVInitViewDelegate <NSObject>
@required
- (TVInitCell *) tvTableView:(UITableView *)tableView cell:(TVInitCell*)cell ForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tvTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void) tvTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (void) tvAppodealInitClick:(id)sender;

@end

@interface TVInitView : UIView

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIButton * bottomButton;

@property (nonatomic, strong) UILabel * bundleID;
@property (nonatomic, strong) UILabel * appKey;

@property (nonatomic, weak) id <TVInitViewDelegate> delegateTVInit;

@end
