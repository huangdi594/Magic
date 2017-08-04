//
//  AppDelegate+UMeng.m
//  Template
//
//  Created by ky_mini on 2017/6/13.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate+UMeng.h"

@implementation AppDelegate (UMeng)

- (void)registerUMeng {
    
    UMConfigInstance.appKey = UMengAPPKey;
    UMConfigInstance.channelId = @"App Store";
    UMConfigInstance.eSType = E_UM_NORMAL; //仅适用于游戏场景，应用统计不用设置
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
    
}


- (void)beginLogPageView:(NSString *)pageName {
    
    [MobClick beginLogPageView:pageName];//("PageOne"为页面名称，可自定义)
    
}

- (void)endLogPageView:(NSString *)pageName {
    [MobClick endLogPageView:pageName];
}

@end
