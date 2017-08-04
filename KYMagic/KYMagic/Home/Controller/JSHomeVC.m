//
//  JSHomeVC.m
//  KYMagic
//
//  Created by ky_mini on 2017/7/26.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSHomeVC.h"


#import "JSPickerDemoVC.h"
#import "JSShareVC.h"  //分享
#import "JSModalPresentVC.h"


@interface JSHomeVC () <ZJScrollPageViewDelegate>

@property(strong, nonatomic) NSMutableArray<NSString *> *titles;
@property(strong, nonatomic) NSMutableArray<UIViewController *> *childVcs;
@property(strong, nonatomic) ZJScrollPageView *scrollPageView;
@property(nonatomic, assign) NSInteger currentVcIndex;


@end

@implementation JSHomeVC


#pragma mark #################################  LifeCycle（生命周期） #################################

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    [self setTitle:@"首页"];
    [self initChildViewController];
    [self setupscrollPageView];
    
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
- (NSMutableArray<NSString *> *)titles {
    if (_titles == nil) {
        _titles = [NSMutableArray arrayWithObjects:@"选择器",@"支付",@"分享",@"模态方式跳转", nil];
    }
    return _titles;
}

- (NSMutableArray<UIViewController *> *)childVcs {
    if (_childVcs == nil) {
        _childVcs = [NSMutableArray array];
    }
    return _childVcs;
}


#pragma mark #################################  UI（界面相关） #################################
- (void)setupscrollPageView {
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showLine = YES;
    style.gradualChangeTitleColor = YES;
    style.autoAdjustTitlesWidth = YES;
    style.adjustCoverOrLineWidth = YES;
    style.scrollLineColor = MainColor;
    style.titleFont = [UIFont systemFontOfSize:15.0];
    style.segmentHeight = SegmentViewHeight;
    style.selectedTitleColor = MainColor;
    style.normalTitleColor = RGBA(106, 107, 107, .5);
    
    
    // 初始化
    self.scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, SCREEN_WIDTH, SCREEN_HEIGHT - 64.0 - 49) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:self.scrollPageView];
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 64.0 + SegmentViewHeight, SCREEN_WIDTH, 0.5);
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    
}

- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
            if (reuseViewController == nil) {
                JSPickerDemoVC * vc = (JSPickerDemoVC *)self.childVcs[index];
                return vc;
            }
            break;
        case 3:
            if (reuseViewController == nil) {
                JSModalPresentVC * vc = (JSModalPresentVC *)self.childVcs[index];
                return vc;
            }
            break;
            
        default:
            
            if (reuseViewController == nil) {
                JSShareVC * vc = (JSShareVC *)self.childVcs[index];
                return vc;
            }
            
            break;
    }
    
    if (reuseViewController == nil) {
        JSShareVC * vc = (JSShareVC *)self.childVcs[index];
        return vc;
    }
    
    
    return nil;
    
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}


- (void)initChildViewController {
    
    
    JSPickerDemoVC * pickerVC = [JSPickerDemoVC new];
    [self.childVcs addObject:pickerVC];
    
    for (int i = 0; i < 2; i++) {
        JSShareVC * shareVC = [JSShareVC new];
        
        [self.childVcs addObject:shareVC];
    }
    
    JSModalPresentVC * modalVC = [JSModalPresentVC new];
    [self.childVcs addObject:modalVC];
    
}


#pragma mark #################################  Delegate（代理方法实现） #################################




#pragma mark #################################  NetWorking（网络请求） #################################



#pragma mark #################################  Event（按钮、手势等事件） #################################




#pragma mark #################################  Public（公共方法） #################################




#pragma mark #################################  Private（私有方法） #################################






@end
