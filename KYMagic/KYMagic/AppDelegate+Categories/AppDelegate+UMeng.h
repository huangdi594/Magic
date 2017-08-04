//
//  AppDelegate+UMeng.h
//  Template
//
//  Created by ky_mini on 2017/6/13.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (UMeng)


/**
 注册友盟
 */
- (void)registerUMeng;


/**
 实现页面的统计 开始  在viewWillAppear中调用

 @param pageName 页面名字
 */
- (void)beginLogPageView:(NSString *)pageName;


/**
 实现页面的统计 结束  在viewWillDisappear中调用
 
 @param pageName 页面名字
 */
- (void)endLogPageView:(NSString *)pageName;

@end
