//
//  JSWeatherTopView.h
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

typedef void(^ChangeCityBlock)();


@interface JSWeatherTopView : UIView

+ (JSWeatherTopView *)instance;

- (void)reloadWeatherData:(WeatherModel *)weatherData;

@property (nonatomic) WeatherModel *weatherData;

@property (nonatomic) ChangeCityBlock changeBlock;


@end
