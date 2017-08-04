//
//  JSPickerDemoVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/1.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSPickerDemoVC.h"

#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"


@interface JSPickerDemoVC () <UITableViewDelegate,UITableViewDataSource,STPickerAreaDelegate, STPickerSingleDelegate, STPickerDateDelegate>

@property (nonatomic,strong) UITableView * table;

@property (nonatomic,strong) NSArray * pickers;
@property (nonatomic,strong) NSMutableArray * contents;
@end

@implementation JSPickerDemoVC

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

- (NSArray *)pickers {
    if (_pickers == nil) {
        _pickers = @[@"普通选择器",@"日期选择器",@"地址选择器"];
    }
    return _pickers;
}

- (NSMutableArray *)contents {
    if (_contents == nil) {
        _contents = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _contents;
}


#pragma mark #################################  UI（界面相关） #################################

- (void)setUI {
    
    [self.view addSubview:self.table];
    [self.table reloadData];
    
    
}



#pragma mark #################################  Delegate（代理方法实现） #################################
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pickers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Picker"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Picker"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.pickers[indexPath.row];
    cell.detailTextLabel.text = self.contents[indexPath.row];

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WS(weakSelf)
    switch (indexPath.row) {
        case 0:
        {
            //普通选择器
            NSMutableArray *arrayData = [NSMutableArray array];
            for (int i = 1; i < 1000; i++) {
                NSString *string = [NSString stringWithFormat:@"%d", i];
                [arrayData addObject:string];
            }
            
            
            STPickerSingle *pickerSingle = [[STPickerSingle alloc]init];
            [pickerSingle setArrayData:arrayData];
            [pickerSingle setTitle:@"请选择价格"];
            [pickerSingle setTitleUnit:@"人民币"];
            [pickerSingle setContentMode:STPickerContentModeBottom];
            [pickerSingle setDelegate:self];
            [pickerSingle show];
        }
            
            break;
        case 1:
        {
            //日期选择器
            STPickerDate *pickerDate = [[STPickerDate alloc]init];
            [pickerDate setYearLeast:1970];
            [pickerDate setYearSum:100];
            [pickerDate setDelegate:self];
            [pickerDate show];
        }
            
            break;
        case 2:
        {
            //地址选择器
            STPickerArea *pickerArea = [[STPickerArea alloc]init];
            [pickerArea setDelegate:weakSelf];
            [pickerArea setSaveHistory:YES];
            [pickerArea setContentMode:STPickerContentModeBottom];
            [pickerArea show];
            
        }
            break;
            
        default:
            break;
    }
    
}

// STPickerArea
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    
    [self.contents removeObjectAtIndex:2];
    [self.contents insertObject:text atIndex:2];
    [self.table reloadData];
    
}

- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    NSString *text = [NSString stringWithFormat:@"%@ 人民币", selectedTitle];
    [self.contents removeObjectAtIndex:0];
    [self.contents insertObject:text atIndex:0];
    [self.table reloadData];
}

- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSString *text = [NSString stringWithFormat:@"%zd年%zd月%zd日", year, month, day];
    [self.contents removeObjectAtIndex:1];
    [self.contents insertObject:text atIndex:1];
    [self.table reloadData];
}

#pragma mark #################################  NetWorking（网络请求） #################################



#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################



@end
