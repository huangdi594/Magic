//
//  JSMineVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/7/26.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSMineVC.h"

@interface JSMineVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UITableView *table;

@end

@implementation JSMineVC

#pragma mark #################################  LifeCycle（生命周期） #################################

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    
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
- (UITableView *)table {
    if (_table == nil) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorColor = [UIColor groupTableViewBackgroundColor];
        _table.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
        
    }
    return _table;
}



#pragma mark #################################  UI（界面相关） #################################
- (void)setUI {
    WS(weakSelf)
    [self setNavBarColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:0.0]];
    [self setTitle:@""];
    
    [self.view addSubview:self.table];
    
    
    UIView * contentView ;
    for (UIView * subview in self.table.subviews) {
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewWrapperView"])
        {
            contentView = subview;
        }
    }
    
    
    UIView * redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    
    [self.table addSubview:redView];
    
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf.table.superview);
        make.bottom.mas_equalTo(contentView.mas_top);
    }];
    
}



#pragma mark #################################  Delegate（代理方法实现） #################################
/* UITableViewDataSource,UITableViewDelegate */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
    
}




#pragma mark #################################  NetWorking（网络请求） #################################



#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################

@end
