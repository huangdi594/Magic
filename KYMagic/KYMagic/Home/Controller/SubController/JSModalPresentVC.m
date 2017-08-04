//
//  JSModalPresentVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/3.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSModalPresentVC.h"
#import "JSBackVC.h"

@interface JSModalPresentVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *table;
@property (nonatomic) NSArray  *titles;

@end

@implementation JSModalPresentVC

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
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBar_HEIGHT-NavigationBar_HEIGHT-SegmentViewHeight) style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorColor = [UIColor groupTableViewBackgroundColor];
        
    }
    return _table;
}

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    }
    return _titles;
}


#pragma mark #################################  UI（界面相关） #################################
- (void)setUI {
    
    
    [self.view addSubview:self.table];
    
    
    
    
}



#pragma mark #################################  Delegate（代理方法实现） #################################
/* UITableViewDataSource,UITableViewDelegate */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifierCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifierCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSBackVC *vc = [[JSBackVC alloc]init];
    
    NSInteger index = [self.titles[indexPath.row] integerValue];
    
    switch (index) {
        case 0:
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            break;
        case 1:
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            break;
        case 2:
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            break;
        case 3:
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            break;
            
        //
        case 4:
            vc.modalPresentationStyle = UIModalPresentationPageSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            break;
        case 5:
            vc.modalPresentationStyle = UIModalPresentationPageSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            break;
        case 6:
            vc.modalPresentationStyle = UIModalPresentationPageSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            break;
        case 7:
            vc.modalPresentationStyle = UIModalPresentationPageSheet;
            vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            break;
            
        //
        case 8:
            vc.modalPresentationStyle = UIModalPresentationFormSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            break;
        case 9:
            vc.modalPresentationStyle = UIModalPresentationFormSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            break;
        case 10:
            vc.modalPresentationStyle = UIModalPresentationFormSheet;
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            break;
        case 11:
            vc.modalPresentationStyle = UIModalPresentationFormSheet;
            vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            break;
            
        //
        case 12:
            vc.modalPresentationStyle = UIModalPresentationCurrentContext;
            vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            break;
        case 13:
            vc.modalPresentationStyle = UIModalPresentationCurrentContext;
            vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            break;
        case 14:
            vc.modalPresentationStyle = UIModalPresentationCurrentContext;
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            break;
        case 15:
            vc.modalPresentationStyle = UIModalPresentationCurrentContext;
            vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            break;
        
            
        default:
            break;
    }
    
    [self presentViewController:vc animated:YES completion:nil];
    
}



#pragma mark #################################  NetWorking（网络请求） #################################



#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################

@end
