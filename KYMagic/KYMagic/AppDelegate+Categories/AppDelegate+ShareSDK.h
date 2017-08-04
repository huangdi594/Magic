//
//  AppDelegate+ShareSDK.h
//  Template
//
//  Created by ky_mini on 2017/6/9.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (ShareSDK)

- (void)registeShareSDK;


- (void)showShareActionWithShareImgs:(NSArray <UIImage *> *)imgNames shareContentText:(NSString *)contentText shareURL:(NSString *)shareUrl shareTitle:(NSString *)shareTitle;

@end
