//
//  MainTabBarController.m
//
//
//  Created by 陶一平 on 2017/4/13.
//  Copyright © 2017年 陶一平. All rights reserved.
//

#import "MainTabBarController.h"
#import "JSHomeVC.h"
#import "JSMineVC.h"
#import "XHSuperNavigationController.h"

#import "JSWeatherVC.h"


@interface MainTabBarController ()
@property (nonatomic,strong) NSMutableArray *navArr;
@end

static MainTabBarController * mainTabBar = nil;

@implementation MainTabBarController


+ (MainTabBarController *)instance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (mainTabBar == nil) {
            mainTabBar = [[super alloc]init];
        }
    });
    return mainTabBar;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    JSHomeVC *homepageVC = [JSHomeVC new];
    JSMineVC *mineVC = [JSMineVC new];
    JSWeatherVC * weatherVC = [JSWeatherVC new];
  
    [self addChildViewControllers:@[homepageVC,mineVC]];
    
    [self tabBarAddSubVC:homepageVC title:@"首页" imageName:@"icon_sy" selecateImage:@"icon_Lsy"];
    [self tabBarAddSubVC:weatherVC title:@"天气" imageName:@"icon_sy" selecateImage:@"icon_Lsy"];
    [self tabBarAddSubVC:mineVC title:@"我的" imageName:@"icon_L、Hwd" selecateImage:@"icon_Lwd"];
    
    self.viewControllers = self.navArr;
    
    [self setBarItem];
}


- (void)setBarItem{
//    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBA(2, 185, 163, 1),UITextAttributeTextColor,nil]forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewControllers:(NSArray *)childControllers  {
    
    for (NSInteger index = 0; index < childControllers.count; index++) {
        XHSuperNavigationController *navHome = [[XHSuperNavigationController alloc] initWithRootViewController:childControllers[index]];
        [super addChildViewController:navHome];
    }
}

-(void)tabBarAddSubVC:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selecateImage:(NSString *)selecateImage{
    VC.tabBarItem.title = title;
    [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:0];
    
    [VC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor} forState:4];
    
    VC.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",selecateImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    XHSuperNavigationController *nav = [[XHSuperNavigationController alloc]initWithRootViewController:VC];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"1_3_fh_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
//    nav.navigationBar.barTintColor = [UIColor colorWithHexString:@"#06bAA4"];
    [self.navArr addObject:nav];
}

- (NSMutableArray *)navArr{
    if (!_navArr) {
        _navArr = [NSMutableArray array];
    }return _navArr;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
