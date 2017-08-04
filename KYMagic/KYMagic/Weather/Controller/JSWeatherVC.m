//
//  JSWeatherVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSWeatherVC.h"

#import "WeatherModel.h"

#import "JSWeatherTopView.h"
#import "JSWeatherHeaderView.h"
#import "JSWeeklyCell.h"

#import "JSProgressHUD.h"
#import "JSRefreshPch.h"

#import "TLCityPickerController.h"


@interface JSWeatherVC () <UITableViewDelegate,UITableViewDataSource,TLCityPickerDelegate>

@property (nonatomic) UITableView *table;
@property (nonatomic) JSWeatherTopView * topview;
@property (nonatomic) JSWeatherHeaderView *headerView;

@property (nonatomic) WeatherModel *model;
@property (nonatomic) NSString *cityName;

@end

@implementation JSWeatherVC

#pragma mark #################################  LifeCycle（生命周期） #################################

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setData];
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
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.showsVerticalScrollIndicator = NO;
        _table.showsHorizontalScrollIndicator = NO;
        _table.backgroundColor = [UIColor clearColor];
        _table.tableFooterView = [UIView new];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
       
        _table.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
        
        [_table registerNib:[UINib nibWithNibName:@"JSWeeklyCell" bundle:nil] forCellReuseIdentifier:@"JSWeeklyCell"];
                            
    }
    return _table;
}

- (JSWeatherTopView *)topview {
    if (_topview == nil) {
        _topview = [JSWeatherTopView instance];
    }
    return _topview;
}

- (JSWeatherHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [JSWeatherHeaderView instance];
    }
    return _headerView;
}


#pragma mark #################################  UI（界面相关） #################################
- (void)setUI {
    
    self.view.backgroundColor = RGBRrom16HexAlpha(0x59B8FF, .5);
    [self.view addSubview:self.table];
    
    
    
    [self.view addSubview:self.topview];
    
    
    
    [self.topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64.f);
        make.height.mas_equalTo(150);
        
    }];
    
    [self getWeatherData];
    [self setRefresh];
}



#pragma mark #################################  Delegate（代理方法实现） #################################

/* TableViewDelegate */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.model.daily.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        JSWeeklyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JSWeeklyCell"];
        Daily * model = self.model.daily[indexPath.row];
        cell.model = model;
        return cell;
    }
    
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 62;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return nil;
    }
    return self.headerView;
}


/* TLCityPickerDelegate */
- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
{
    self.cityName = city.shortName;
    [self getWeatherData];
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}



#pragma mark #################################  NetWorking（网络请求） #################################

- (void)getWeatherData {
    WS(weakSelf)
    
    [JSProgressHUD show:@"请求数据" inView:self.view mode:JSProgressModeLoading];
    
    [NetworkRequest sendGETWithUrl:@"weather/query" parameters:@{@"city":self.cityName} success:^(id responseObject) {
        
        NSDictionary * dic = responseObject[@"result"];
        
        weakSelf.model = [[WeatherModel alloc]initWithDictionary:dic];
        [weakSelf.topview reloadWeatherData:weakSelf.model];
        [weakSelf.headerView reloadHourlyDatas:weakSelf.model.hourly];
        [weakSelf.table reloadData];
        [JSProgressHUD showMessage:@"请求成功" inView:weakSelf.view];
        [weakSelf.table.mj_header endRefreshing];
    } failure:^(NSString *errorStr) {
        [JSProgressHUD showMessage:@"请求失败" inView:weakSelf.view];
        [weakSelf.table.mj_header endRefreshing];
    }];
    
}


#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################

- (void)setData {
    
    self.cityName = @"成都";
    
}

- (void)setRefresh {
    WS(weakSelf)
    self.table.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(getWeatherData)];
    
    self.topview.changeBlock = ^{
        
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        [cityPickerVC setDelegate:weakSelf];
        
        cityPickerVC.locationCityID = @"800010000";
        //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
        //cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
        
        [weakSelf presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
            
        }];
        
    };
    
}

@end
