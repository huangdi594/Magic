//
//  AppDelegate+JPush.m
//  Template
//
//  Created by ky_mini on 2017/6/13.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate+JPush.h"
#import "MainTabBarController.h"
#import "XHSuperNavigationController.h"




@implementation AppDelegate (JPush)


- (void)registerJpush:(NSDictionary *)launchOptions {
    
    
    //获取自定义消息
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    //添加初始化APNs代码
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    
    
    BOOL apsForProduction = YES;
#if DEBUG
    apsForProduction = NO;
#endif
    
    [JPUSHService setupWithOption:launchOptions appKey:JPushAppKey
                          channel:JPushNotAppStory
                 apsForProduction:apsForProduction
            advertisingIdentifier:nil];
    
}


//注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
//    [MHUIUtil alert:@"deviceToken注册成功"];
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    
    
    [self bindPushId];
}


- (void)bindPushId {
    
    if ([UserModel ShareUserModel].isLogin) {
        
        [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
            NSLog(@"resCode : %d,registrationID: %@",resCode,registrationID);
            
            if (![MHUIUtil isEmptyStr:registrationID]) {
                [NetworkRequest sendPOSTHttpWithUrl:BindPushIdURL parameters:@{@"pushId":registrationID,@"pushType":@"IOS"} success:^(id responseObject) {
                    
                    NSLog(@"绑定推送id成功");
                    
                } failure:^(NSString *errorStr) {
                    [MHUIUtil alert:errorStr];
                }];
            }
            
        }];
        
    }
    
}

- (void)cancelPushId {
    
    [NetworkRequest sendPOSTHttpWithUrl:BindPushIdURL parameters:@{@"pushId":@"",@"pushType":@"IOS"} success:^(id responseObject) {
        
        NSLog(@"注销推送id成功");
        
    } failure:^(NSString *errorStr) {
        [MHUIUtil alert:errorStr];
    }];
    
}

//实现注册APNs失败接口（可选）
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}


#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
        [JPUSHService handleRemoteNotification:userInfo];
        
        /// 应用处于前台收到推送的时候转成本地通知 ===========================
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.alertTitle = [userInfo valueForKey:@"title"];
        notification.alertBody = [userInfo valueForKey:@"content"];
        notification.userInfo = userInfo;
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [self handlerPushNotification:userInfo];
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [self handlerPushNotification:userInfo];
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [self handlerPushNotification:userInfo];
    [JPUSHService handleRemoteNotification:userInfo];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    //    [APService stopLogPageView:@"aa"];
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down
    // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate
    // timers, and store enough application state information to restore your
    // application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called
    // instead of applicationWillTerminate: when the user quits.
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
}



#pragma mark 获取自定义消息内容

// type 1 2 4 9 10 跳转大消息中心页面
// type 3 跳转在线反馈页面
// type 7 跳转到服务消息中心
// type 5 6 8 跳转到问答消息中心
- (void)handlerPushNotification : (NSDictionary *)_noti {
    
    NSString *content = [_noti valueForKey:@"content"]; //内容
    
    NSString *targetId = [_noti valueForKey:@"targetId"]; //扩展id
    NSString *type = [_noti valueForKey:@"type"];         //类型
    NSString *title = [_noti valueForKey:@"title"];       //标题
    
    
    NSLog(@"自定义message:%@",_noti);
    NSLog(@"推%@",content);
    NSLog(@"推%@",targetId);
    NSLog(@"推%@",type);
    NSLog(@"推%@",title);
    
    
    NSInteger typeIndex = [type integerValue];
    
    switch (typeIndex) {
        case PushType_PASSWORD_UPDATE_SUCCESS:
        case PushType_EXCEPTION_LOGIN:
        case PushType_BACKGROUD_PUSH_MESSAGE:
        case PushType_AUDIT_SUCCESS:
        case PushType_PUBLIC_MESSAGE:
            // type 1 2 4 9 10 跳转大消息中心页面
            
            
            break;
            
        case PushType_FEED_BACK_REPLAY:
            // type 3 跳转在线反馈页面
            
            
            break;
            
        case PushType_BUY_PRODUCT:
            // type 7 跳转到服务消息中心
            
            
            break;
            
        case PushType_QUESTION_DELETE:
        case PushType_QUESTION_RECOMEND:
            // type 5 6 跳转到问答消息中心

            
            
            break;
            
        case PushType_QUESTION_REPLAY:
            // type 8 跳转到问答消息
            
            

            
            
            
            break;

            
        default:
            break;
    }
    
    
    
    
    
}







@end
