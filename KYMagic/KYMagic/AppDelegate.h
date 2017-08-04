//
//  AppDelegate.h
//  KYMagic
//
//  Created by ky_mini on 2017/7/24.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <UIKit/UIKit.h>

// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,JPUSHRegisterDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)shareInstance;

@end

