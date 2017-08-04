//
//  JSWeatherHeaderView.h
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSWeatherHourlyCell.h"

@interface JSWeatherHeaderView : UIView

+ (JSWeatherHeaderView *)instance;

-(void)reloadHourlyDatas:(NSArray *)hourlys;
@property (nonatomic) NSArray *hourlys;

@property (weak, nonatomic) IBOutlet UICollectionView *hourlyCollectionView;

@end
