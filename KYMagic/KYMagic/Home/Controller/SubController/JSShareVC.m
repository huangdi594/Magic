//
//  JSShareVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/7/31.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSShareVC.h"

@interface JSShareVC ()

@end

@implementation JSShareVC

#pragma mark #################################  LifeCycle（生命周期） #################################

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    
    self.view.backgroundColor = RGB(R, G, B);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark #################################  Setter&Getter（属性设置与获取） #################################



#pragma mark #################################  UI（界面相关） #################################




#pragma mark #################################  Delegate（代理方法实现） #################################




#pragma mark #################################  NetWorking（网络请求） #################################



#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################



@end
