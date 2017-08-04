//
//  JSGuidePageVC.h
//  KYMagic
//
//  Created by ky_mini on 2017/7/28.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "CWSuperViewController.h"
#import "UIView+LBExtension.h"
#import "JSGuideExButton.h"

@interface JSGuidePageVC : CWSuperViewController

/**
 *  初始化
 *
 *  @param array       传入一个数组
 *  @param buttonSize  按钮的宽度和高度
 *  @param buttonTitle 按钮显示的文字
 *  @param imageName   按钮的图片
 *  @param titleColor  按钮文字的颜色
 *  @param startHeight 按钮的Y的比率
 *  @param controller  按钮点击跳转的界面
 *
 *  @return self
 */
- (instancetype)initWithNSArray:(NSMutableArray *)array withButtonSize:(CGSize)buttonSize withButtonTitle:(NSString *)buttonTitle withButtonImage:(NSString *)imageName withButtonTitleColor:(UIColor *)titleColor withButtonHeight:(CGFloat)startHeight withViewController:(UIViewController *)controller;

@end
