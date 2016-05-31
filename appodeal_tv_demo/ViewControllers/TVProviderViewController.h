//
//  TVProviderViewController.h
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 04/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TVProviderControllerDelegate <NSObject>
@required
-(void) providerlist:(NSArray *) providerList;

@end

@interface TVProviderViewController : UIViewController

@property (nonatomic, weak) id <TVProviderControllerDelegate> delegateTVProvC;

@end
