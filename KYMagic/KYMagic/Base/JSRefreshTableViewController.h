//
//  JSRefreshTableViewController.h
//  KYMagic
//
//  Created by ky_mini on 2017/8/7.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "CWSuperViewController.h"

@interface JSRefreshTableViewController : CWSuperViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (nonatomic) int page;

@property (nonatomic) BOOL showRefreshHeader;//是否支持下拉刷新
@property (nonatomic) BOOL showRefreshFooter;//是否支持上拉加载
@property (nonatomic) BOOL showTableBlankView;//是否显示无数据时默认背景

- (instancetype)initWithStyle:(UITableViewStyle)style;

- (void)tableViewDidTriggerHeaderRefresh;//下拉刷新事件
- (void)tableViewDidTriggerFooterRefresh;//上拉加载事件

- (void)tableViewDidFinishTriggerHeader:(BOOL)isHeader reload:(BOOL)reload;//是否刷新界面


@end
