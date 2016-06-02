//
//  TVInitViewController.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 01/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "Appodeal.h"
#import "AppDelegate.h"

#import "TVInitViewController.h"
#import "TVMainViewController.h"
#import "TVProviderViewController.h"
#import "TVInitView.h"
#import "TVInitCell.h"

@interface TVInitViewController () <TVInitViewDelegate, TVProviderControllerDelegate>
{
    TVInitView * initView;
    
    NSMutableDictionary * selectedDict;
    NSArray * checkProvidersList;
    
    BOOL rewardAutoCache;
    BOOL skippableAutoCache;
    BOOL testMode;
}
@end

@implementation TVInitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        selectedDict = [NSMutableDictionary dictionary];
        
        rewardAutoCache = YES;
        skippableAutoCache = YES;
        testMode = NO;
    }
    
    {
        self.navigationItem.title = [ @"Appodeal AppleTV SDK v" stringByAppendingString: AppodealSdkVersionString( )];
        
        initView = [[TVInitView alloc] initWithFrame:self.view.frame];
        initView.bundleID.text = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
        initView.appKey.text = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppodealAppKey"];
        initView.delegateTVInit = self;
        self.view = initView;
    }
}

- (UIView *) selectedViewWithStatus:(BOOL) status {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.layer.cornerRadius = 25.0f;
    view.backgroundColor = status ? UIColor.redColor : UIColor.grayColor;
    return view;
}

- (NSString *) createProvederString{
    NSString * resultString = @"Supported Video Providers: (";
    if ([checkProvidersList count] == 0 || !checkProvidersList) {
        NSArray * resultArray = PROVIDERS;
        for (NSString * provider in resultArray) {
            resultString = [[[resultString stringByAppendingString:provider] capitalizedString] stringByAppendingString:@", "];
        }
        resultString = [[resultString substringWithRange:NSMakeRange(0, [resultString length] - 2)] stringByAppendingString:@")"];
    } else {
        for (NSString * provider in checkProvidersList) {
            resultString = [[[resultString stringByAppendingString:provider] capitalizedString] stringByAppendingString:@", "];
        }
        resultString = [[resultString substringWithRange:NSMakeRange(0, [resultString length] - 2)] stringByAppendingString:@")"];
    }
    return resultString;
}

#pragma mark --- Delegate

- (NSInteger) tvTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (TVInitCell *) tvTableView:(UITableView *)tableView cell:(TVInitCell *)cell ForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Rewarded Video AutoCache";
            cell.accessoryView = [self selectedViewWithStatus:rewardAutoCache];
            break;
        case 1:
            cell.textLabel.text = @"Skippable Video AutoCache";
            cell.accessoryView = [self selectedViewWithStatus:skippableAutoCache];
            break;
        case 2:
            cell.textLabel.text = [self createProvederString];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:
            cell.textLabel.text = @"Test Mode";
            cell.accessoryView = [self selectedViewWithStatus:testMode];
            break;
        default:
            break;
    }
    return cell;
}

- (void) tvTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 2 && indexPath.section == 0) {
        if (indexPath.row == 0) {
            rewardAutoCache = rewardAutoCache ? NO : YES;
        } else if (indexPath.row == 1) {
            skippableAutoCache = skippableAutoCache ? NO : YES;
        } else if (indexPath.row == 3){
            testMode = testMode ? NO : YES;
        }
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    } else if (indexPath.row == 2 && indexPath.section == 0) {
        TVProviderViewController * nextController = [TVProviderViewController new];
        nextController.delegateTVProvC = self;
        [self.navigationController pushViewController:nextController animated:YES];
    }
}

#pragma mark --- APPODEAL INIT

- (void) tvAppodealInitClick:(id)sender {
    [((AppDelegate *)[[UIApplication sharedApplication] delegate]) initAppodealProvider:[checkProvidersList count] == 0 ? PROVIDERS : checkProvidersList
                                                                        rewardAutoCache:rewardAutoCache
                                                                     skippableAutoCache: skippableAutoCache
                                                                               testMode:testMode];
}

#pragma mark --- CallBackDelegate

- (void) providerlist:(NSArray *)providerList {
    checkProvidersList = [NSArray arrayWithArray:providerList];
    [initView.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
