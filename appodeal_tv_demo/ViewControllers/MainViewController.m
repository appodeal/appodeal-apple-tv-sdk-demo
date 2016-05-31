//
//  MainViewController.m
//  appodeal_tv_demo
//
//  Created by Lozhkin Ilya on 5/31/16.
//  Copyright © 2016 Lozhkin Ilya. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()
{
    MainView * _mainView;
}
@end

@implementation MainViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    {
        _mainView = [[MainView alloc] initWithFrame:self.view.frame];
        self.view = _mainView;
    }
}

@end
