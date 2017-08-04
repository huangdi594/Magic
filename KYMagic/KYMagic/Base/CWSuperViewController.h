//
//  XMFatherViewController.h
//  xueshaqu
//
//  Created by 向文品 on 14/12/25.
//  Copyright (c) 2014年 ciwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWSuperViewController : UIViewController<UITextFieldDelegate>
//没有任何数据时的显示，使用时，设置其属性为hidden,不用时，隐藏即可
@property (nonatomic, strong) UIView *noTextView;
//数据加载错误时的显示，使用时，设置其属性为hidden，不用时，隐藏即可
@property (nonatomic, strong) UIView *errorTipView;


@property (nonatomic, strong) UILabel * titleLabel;

- (void)clickRefreshButton;//刷新错误时，重新刷新的按钮点击事件
@property (nonatomic,assign) BOOL showBack;
- (void)setNavBarColor:(UIColor *)color;
- (void)setTitle:(NSString *)title;
- (void)setShowBack:(BOOL)showBack;
- (void)setNavTintColor:(UIColor *)color;
- (void)setRightBtnTitle:(NSString *)text;
- (void)back;
- (void)addViewToNavBar:(UIView *)view Frame:(CGRect)Frame;

typedef void(^RightBtnBlock)();
@property (nonatomic, copy) RightBtnBlock  rightBtnBlock;

- (void)rightBtnAction:(RightBtnBlock)rightBtnBlock;

@end
