//
//  XMFatherViewController.m
//  xueshaqu
//
//  Created by 向文品 on 14/12/25.
//  Copyright (c) 2014年 ciwei. All rights reserved.
//

#import "CWSuperViewController.h"


@interface CWSuperViewController ()
{
//    UILabel *titleLabel;
    UIButton *backButton;
    UIButton *rightBtn;
}
@property (nonatomic, strong) UIView *xh_NavigationBar;
@property (strong, nonatomic) UIView *xh_NavView;
@end

@implementation CWSuperViewController
#pragma mark --- lazy load
- (UIView *)errorTipView{
    if (_errorTipView == nil) {
        _errorTipView = [[UIView alloc] init];
        _errorTipView.backgroundColor = RGBA(229, 229, 229, 1);
        [self.view addSubview:_errorTipView];
        
        [_errorTipView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(64);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
        
        
        UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        refreshButton.backgroundColor = mainColor;
        [refreshButton setTitleColor:MainColor forState:0];
        [refreshButton setImage:[UIImage imageNamed:@"icon_zwsj"] forState:UIControlStateNormal];
        [refreshButton addTarget:self action:@selector(clickRefreshButton) forControlEvents:UIControlEventTouchUpInside];
        [_errorTipView addSubview:refreshButton];
        
        [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).with.offset(0);
            make.top.equalTo(self.view).with.offset(64);
            make.right.equalTo(self.view).with.offset(0);
            make.bottom.equalTo(self.view).with.offset(0);
        }];
        
        
        
        UILabel *noTextLabel = [[UILabel alloc] init];
        
        noTextLabel.text = @"点击重新加载";
        noTextLabel.textAlignment = NSTextAlignmentCenter;
        [_errorTipView addSubview:noTextLabel];
        noTextLabel.textColor = MainColor;
        noTextLabel.backgroundColor = [UIColor clearColor];
        
        [noTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_errorTipView);
            make.bottom.equalTo(_errorTipView).offset(-160*SCREEN_H_RATE);
            make.left.equalTo(_errorTipView);
            make.right.equalTo(_errorTipView);
            make.height.mas_equalTo(25 *SCREEN_H_RATE);
        }];
        
    }
    return _errorTipView;
}

- (UIView *)noTextView{
    if (_noTextView == nil) {
        _noTextView = [[UIView alloc] init];
        _noTextView.backgroundColor = RGBA(229, 229, 229, 1);
        [self.view addSubview:_noTextView];
        [_noTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        
        UILabel *noTextLabel = [[UILabel alloc] init];
        noTextLabel.text = @"暂无内容";
        noTextLabel.textAlignment = NSTextAlignmentCenter;
        [_noTextView addSubview:noTextLabel];
        noTextLabel.textColor = RGBA(138, 137, 137, 1);
        noTextLabel.backgroundColor = [UIColor clearColor];
        
        [noTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_noTextView);
            make.top.equalTo(_noTextView).offset(260 *SCREEN_H_RATE);
            make.left.equalTo(_noTextView);
            make.right.equalTo(_noTextView);
            make.height.mas_equalTo(25 *SCREEN_H_RATE);
        }];
        
    }
    return _noTextView;
}

#pragma mark --- life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.noTextView.hidden = YES;
    self.errorTipView.hidden = YES; 
    
    _xh_NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, StatusBar_HEIGHT + NavigationBar_HEIGHT)];
    _xh_NavView.backgroundColor = MainColor;
    [self.view addSubview:_xh_NavView];
    
    _xh_NavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, StatusBar_HEIGHT, SCREEN_WIDTH, NavigationBar_HEIGHT)];
    [_xh_NavView addSubview:_xh_NavigationBar];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = Font_bold(17);
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_xh_NavigationBar addSubview:_titleLabel];
    _titleLabel.text = @"界面标题";
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_xh_NavigationBar);
        make.centerY.equalTo(_xh_NavigationBar);
    }];
    _showBack = YES;
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_xh_NavigationBar addSubview:backButton];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_xh_NavigationBar).offset(10);
        make.centerY.equalTo(_xh_NavigationBar);
        make.width.mas_equalTo(NavigationBar_HEIGHT);
        make.height.mas_equalTo(NavigationBar_HEIGHT);
    }];
    
    //导航栏右侧按钮 默认隐藏
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_xh_NavigationBar addSubview:rightBtn];
    rightBtn.titleLabel.font = Font_bold(13);
    rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_xh_NavigationBar).offset(-10);
        make.centerY.equalTo(_xh_NavigationBar);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(NavigationBar_HEIGHT);
    }];
    
    rightBtn.hidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
}

-(void)back{
    if (self.navigationController.viewControllers.count <= 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//导航栏右侧点击事件
- (void)rightBtnAction{
    if (self.rightBtnBlock) {
        self.rightBtnBlock();
    }
    
}


- (void)rightBtnAction:(RightBtnBlock)rightBtnBlock{
    _rightBtnBlock = rightBtnBlock;
}
-(void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}
- (void)setNavBarColor:(UIColor *)color{
    _xh_NavView.backgroundColor = color;
    _xh_NavigationBar.backgroundColor = color;
}

- (void)setNavTintColor:(UIColor *)color{
    _titleLabel.textColor = color;
}
-(void)setShowBack:(BOOL)showBack{
    _showBack = showBack;
    backButton.hidden = !showBack;
}

- (void)setRightBtnTitle:(NSString *)text{
    [rightBtn setTitle:text forState:UIControlStateNormal];
    rightBtn.hidden = NO;
}

- (void)addViewToNavBar:(UIView *)view Frame:(CGRect)Frame{
    view.frame = Frame;
    view.adjust_CenterY = _titleLabel.adjust_CenterY;
    [_xh_NavigationBar addSubview:view];
    
}

- (void)setNavBarHide:(BOOL)hide{
    self.xh_NavView.hidden = YES;
    self.xh_NavigationBar.hidden = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark --- event response
- (void)clickRefreshButton{
    NSLog(@"重新刷新了····");
}
@end
