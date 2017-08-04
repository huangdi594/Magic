//
//  AppManager.h
//  金管家(专家端)
//
//  Created by ky_mini on 2017/7/19.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHSuperNavigationController.h"

@interface AppManager : NSObject <UITabBarControllerDelegate>

@property (nonatomic) XHSuperNavigationController * mainHome;

+ (AppManager *)shareInstance;
+ (void)pushViewController : (UIViewController *)_viewController Animated:(BOOL)_animated;

- (UIViewController *)getRootViewController;
@end
