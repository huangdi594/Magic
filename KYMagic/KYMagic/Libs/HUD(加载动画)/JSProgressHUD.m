//
//  JSProgressHUD.m
//  KYMagic
//
//  Created by ky_mini on 2017/7/28.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSProgressHUD.h"
#import <YYImage/YYImage.h>

@implementation JSProgressHUD

+(instancetype)shareinstance{
    
    static JSProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JSProgressHUD alloc] init];
    });
    
    return instance;
    
}

+(void)showKwindowNoNetWorkHUD:(NSString *)msg{
    if ([JSProgressHUD shareinstance].netWorkHUD != nil) {
        [[JSProgressHUD shareinstance].netWorkHUD hideAnimated:YES];
        [JSProgressHUD shareinstance].netWorkHUD = nil;
    }
    [JSProgressHUD shareinstance].netWorkHUD = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    [JSProgressHUD shareinstance].netWorkHUD.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT*0.8);
    [JSProgressHUD shareinstance].netWorkHUD.bezelView.color = [UIColor blackColor];
    [[JSProgressHUD shareinstance].netWorkHUD setMargin:10];
    [[JSProgressHUD shareinstance].netWorkHUD setRemoveFromSuperViewOnHide:YES];
    [JSProgressHUD shareinstance].netWorkHUD.detailsLabel.text = msg;
    [JSProgressHUD shareinstance].netWorkHUD.contentColor = [UIColor whiteColor];
    [JSProgressHUD shareinstance].netWorkHUD.detailsLabel.font = [UIFont systemFontOfSize:14];
    [JSProgressHUD shareinstance].netWorkHUD.mode = MBProgressHUDModeText;
    [JSProgressHUD shareinstance].netWorkHUD.userInteractionEnabled = NO;
}

+(void)netWorkHudHide{
    if ([JSProgressHUD shareinstance].netWorkHUD != nil) {
        [[JSProgressHUD shareinstance].netWorkHUD hideAnimated:YES];
    }
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(JSProgressMode)myMode{
    //如果已有弹框，先消失
    if ([JSProgressHUD shareinstance].hud != nil) {
        [[JSProgressHUD shareinstance].hud hideAnimated:YES];
        [JSProgressHUD shareinstance].hud = nil;
    }
    
    //4\4s屏幕避免键盘存在时遮挡
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    [JSProgressHUD shareinstance].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //[YJProgressHUD shareinstance].hud.dimBackground = YES;    //是否显示透明背景
    [JSProgressHUD shareinstance].hud.bezelView.color = [UIColor blackColor];
    [[JSProgressHUD shareinstance].hud setMargin:10];
    [[JSProgressHUD shareinstance].hud setRemoveFromSuperViewOnHide:YES];
    [JSProgressHUD shareinstance].hud.detailsLabel.text = msg;
    [JSProgressHUD shareinstance].hud.contentColor = [UIColor whiteColor];
    [JSProgressHUD shareinstance].hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    switch (myMode) {
        case JSProgressModeOnlyText:
            [JSProgressHUD shareinstance].hud.mode = MBProgressHUDModeText;
            break;
            
        case JSProgressModeLoading:
            [JSProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case JSProgressModeCircleLoading:
            [JSProgressHUD shareinstance].hud.mode = MBProgressHUDModeDeterminate;
            break;
            
        case JSProgressModeSuccess:
            [JSProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            [JSProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
            break;
            
        case JSProgressModeCusGif:{
            [JSProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            YYImage *image = [YYImage imageNamed:@"ProgressAnimation.gif"];
            YYAnimatedImageView *gifImageView = [[YYAnimatedImageView alloc] initWithImage:image];
            [JSProgressHUD shareinstance].hud.customView = gifImageView;
            [JSProgressHUD shareinstance].hud.contentColor = [UIColor redColor];
            [JSProgressHUD shareinstance].hud.bezelView.color = [UIColor clearColor];
        }
            break;
            
        default:
            break;
    }
    
}


+(void)hide{
    if ([JSProgressHUD shareinstance].hud != nil) {
        [[JSProgressHUD shareinstance].hud hideAnimated:YES];
    }
}


+(void)showCusGif:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeCusGif];
}

+(void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeOnlyText];
    [[JSProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
}


+(void)showOnlyText:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeOnlyText];
}

+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeOnlyText];
    [[JSProgressHUD shareinstance].hud hideAnimated:YES afterDelay:delay];
}

+(void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeSuccess];
    [[JSProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}


+(void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeLoading];
}

+(void)showMsgWithoutView:(NSString *)msg{
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [self show:msg inView:view mode:(JSProgressMode)JSProgressModeOnlyText];
    [[JSProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}


@end
