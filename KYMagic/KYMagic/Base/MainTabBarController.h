//
//  MainTabBarController.h
//  流量汤圆
//
//  Created by 陶一平 on 2017/4/13.
//  Copyright © 2017年 陶一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController

+ (MainTabBarController *)instance;

@property (nonatomic, strong) NSString * tabBarItem;

@end
