//
//  XHSuperNavigationController.m
//  Template
//
//  Created by XuHuan on 2017/5/22.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "XHSuperNavigationController.h"


@implementation XHSuperNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = NO; // 使右滑返回手势可用
    self.navigationBar.hidden = YES; // 隐藏导航栏
}

@end
