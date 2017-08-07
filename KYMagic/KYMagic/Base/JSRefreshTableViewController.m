//
//  JSRefreshTableViewController.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/7.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSRefreshTableViewController.h"

@interface JSRefreshTableViewController ()
@property (nonatomic, readonly) UITableViewStyle style;
@end

@implementation JSRefreshTableViewController

#pragma mark --- lazy load

#pragma mark --- life cycle
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.page = 0;
    self.showRefreshHeader = YES;
    self.showRefreshFooter = YES;
    //错误视图在tableView之前
    [self.errorTipView removeFromSuperview];
    [self.view insertSubview:self.errorTipView atIndex:self.view.subviews.count - 1];
    //没有任何内容在错误视图之前
    [self.noTextView removeFromSuperview];
    [self.view insertSubview:self.noTextView atIndex:self.view.subviews.count - 1];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark - setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    if (_showRefreshHeader != showRefreshHeader) {
        _showRefreshHeader = showRefreshHeader;
        if (_showRefreshHeader) {
            WS(weakSelf)
            self.tableView.mj_header = [JSRefrshHeader headerWithRefreshingBlock:^{
                [weakSelf tableViewDidTriggerHeaderRefresh];
                [weakSelf.tableView.mj_header beginRefreshing];
            }];
        }
        else{
            
        }
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    WS(weakSelf)
    if (_showRefreshFooter != showRefreshFooter) {
        _showRefreshFooter = showRefreshFooter;
        if (_showRefreshFooter) {
            self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                [weakSelf tableViewDidTriggerFooterRefresh];
                [weakSelf.tableView.mj_footer beginRefreshing];
            }];
        }
        else{
            self.tableView.mj_footer.hidden = NO;
        }
    }
}

- (void)setShowTableBlankView:(BOOL)showTableBlankView
{
    if (_showTableBlankView != showTableBlankView) {
        _showTableBlankView = showTableBlankView;
    }
}

#pragma mark - getter

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
*/
#pragma mark - Table view delegate
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCELLDEFAULTHEIGHT;
}
*/

#pragma mark - public refresh

- (void)autoTriggerHeaderRefresh
{
    if (self.showRefreshHeader) {
        [self tableViewDidTriggerHeaderRefresh];
    }
}

- (void)autoTriggerFooterRefresh
{
    if (self.showRefreshFooter) {
        [self tableViewDidTriggerFooterRefresh];
    }
}

/**
 *  下拉刷新事件
 */
- (void)tableViewDidTriggerHeaderRefresh
{
    
}

/**
 *  上拉加载事件
 */
- (void)tableViewDidTriggerFooterRefresh
{
    
}

- (void)tableViewDidFinishTriggerHeader:(BOOL)isHeader reload:(BOOL)reload
{
    WS(weakSelf)
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload) {
            [weakSelf.tableView reloadData];
        }
        
        if (isHeader) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        else{
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    });
}


@end
