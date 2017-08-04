//
//  AppDelegate+JPush.h
//  Template
//
//  Created by ky_mini on 2017/6/13.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate.h"

// type 1 2 4 9 10 跳转大消息中心页面
// type 3 跳转在线反馈页面
// type 7 跳转到服务消息中心
// type 5 6 8 跳转到问答消息中心

typedef NS_ENUM (NSInteger,PushType) {
    /**
     * 密码修改成功 推送+内置+短信
     */
    PushType_PASSWORD_UPDATE_SUCCESS = 1,
    /**
     * 异常登录 推送+内置+短信
     */
    PushType_EXCEPTION_LOGIN = 2,
    /**
     * 后台回复反馈 推送+内置
     */
    PushType_FEED_BACK_REPLAY = 3,
    /**
     * 后台推送 自定义
     */
    PushType_BACKGROUD_PUSH_MESSAGE = 4,
    /**
     * 提问被删除 推送+内置+短信
     */
    PushType_QUESTION_DELETE = 5,
    /**
     * 提问被推荐 推荐+内置+短信
     */
    PushType_QUESTION_RECOMEND = 6,
    
    /**
     * 给公司购买产品 推送+内置
     */
    PushType_BUY_PRODUCT = 7,
    
    /**
     * 问答被回复 推送+内置 专家回复 推荐+内置+短信
     */
    PushType_QUESTION_REPLAY = 8,
    /**
     * 审核通知 推送+内置+短信
     */
    PushType_AUDIT_SUCCESS = 9,
    
    /**
     * 公告消息 推送+内置+短信
     */
    PushType_PUBLIC_MESSAGE = 10,
    
    /**
     * 反馈成功 推送+内置
     */
    PushType_FEEDBACK_MESSAGE = 11,
    
    /**
     * 评论被评分
     */
    PushType_COMMENT_COMMENT_SCORE = 12,
};


@interface AppDelegate (JPush)


- (void)registerJpush:(NSDictionary *)launchOptions;

/*-- 绑定推送id（登录成功后调用） --*/
- (void)bindPushId;

/*-- 注销推送id（退出成功后调用） --*/
- (void)cancelPushId;

@end
