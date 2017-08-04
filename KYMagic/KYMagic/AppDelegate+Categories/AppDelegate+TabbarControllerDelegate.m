//
//  AppDelegate+TabbarControllerDelegate.m
//  Template
//
//  Created by ky_mini on 2017/6/6.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate+TabbarControllerDelegate.h"


#import "XHSuperNavigationController.h"


@implementation AppDelegate (TabbarControllerDelegate)

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    
    

    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@""]) {
        
        
    }
    
    return YES;
}



@end
