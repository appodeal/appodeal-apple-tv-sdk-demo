//
//  TVProviderView.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 04/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVProviderCell.h"

@protocol TVProviderDelegate <NSObject>
@required
- (TVProviderCell *) tvTableView:(UITableView *)tableView cell:(TVProviderCell*)cell ForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tvTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void) tvTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface TVProviderView : UIView

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, weak) id <TVProviderDelegate> delegateTVProvider;

@end
