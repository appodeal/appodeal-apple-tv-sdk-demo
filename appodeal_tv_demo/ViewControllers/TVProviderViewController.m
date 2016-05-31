//
//  TVProviderViewController.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 04/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "AppDelegate.h"
#import "TVProviderViewController.h"
#import "TVProviderView.h"
#import "TVProviderCell.h"

@interface TVProviderViewController () <TVProviderDelegate>
{
    TVProviderView * providerView;
    
    NSMutableDictionary * selectedDict;
}
@end

@implementation TVProviderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        [self createStartPosition];
    }
    
    {
        providerView = [[TVProviderView alloc] initWithFrame:self.view.frame];
        providerView.delegateTVProvider = self;
        self.view = providerView;
    }
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.delegateTVProvC providerlist:[self providerList]];
}

- (NSArray *) providerList {
    NSMutableArray * list = [NSMutableArray array];
    if (selectedDict) {
        for (NSIndexPath * indexPath in selectedDict) {
            [list addObject:PROVIDERS[indexPath.row]];
        }
        [list addObject:@"vast"];
    }
    return list;
}

- (void) createStartPosition {
    selectedDict = [NSMutableDictionary dictionary];
    for (NSInteger i = 1; i < [PROVIDERS count]; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        selectedDict[indexPath] = @(1);
    }
    
}

- (UIView *) selectedViewWithStatus:(NSNumber *) status {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.layer.cornerRadius = 25.0f;
    view.backgroundColor = [status isEqual:@(1)] ? UIColor.redColor : UIColor.grayColor;
    return view;
}

#pragma mark --- Delegate

- (NSInteger) tvTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [PROVIDERS count];
}

- (TVProviderCell *) tvTableView:(UITableView *)tableView cell:(TVProviderCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"VAST";
            cell.accessoryView = [self selectedViewWithStatus:@(1)];
            break;
        case 1:
            cell.textLabel.text = @"Applovin";
            cell.accessoryView = [self selectedViewWithStatus:selectedDict[indexPath] ? selectedDict[indexPath] : @(0)];
            break;
        case 2:
            cell.textLabel.text = @"SpotX";
            cell.accessoryView = [self selectedViewWithStatus:selectedDict[indexPath] ? selectedDict[indexPath] : @(0)];
            break;
        default:
            break;
    }
    return cell;
}

- (void) tvTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 0) {
        selectedDict[indexPath] = selectedDict[indexPath] ? nil : @(1);
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
