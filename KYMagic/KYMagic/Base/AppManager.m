//
//  AppManager.m
//  金管家(专家端)
//
//  Created by ky_mini on 2017/7/19.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "AppManager.h"


static AppManager *appManager;

@implementation AppManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        MainTabBarController * _mainTab = [MainTabBarController instance];
        _mainTab.delegate = self;
        
        XHSuperNavigationController *home = [[XHSuperNavigationController alloc] initWithRootViewController:_mainTab];
        self.mainHome = home;
    }
    return self;
}

+ (AppManager *)shareInstance{
    if (!appManager) {
        appManager = [[AppManager alloc] init];
        
    }
    return appManager;
}

+ (void)pushViewController : (UIViewController *)_viewController Animated:(BOOL)_animated{
    UINavigationController *nav = (UINavigationController *)[AppManager shareInstance].mainHome;
    [nav pushViewController:_viewController animated:_animated];
}

- (UIViewController *)getRootViewController{
    
    return self.mainHome;
}



@end
