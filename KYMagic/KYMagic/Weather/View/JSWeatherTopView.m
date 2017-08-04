//
//  JSWeatherTopView.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSWeatherTopView.h"

@interface JSWeatherTopView ()
@property (weak, nonatomic) IBOutlet UILabel *cityNameLB;
@property (weak, nonatomic) IBOutlet UILabel *dateLB;
@property (weak, nonatomic) IBOutlet UILabel *weekLB;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImgView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLB;
@property (weak, nonatomic) IBOutlet UILabel *wenDuLB;
@property (weak, nonatomic) IBOutlet UILabel *high_LowTempLB;
@property (weak, nonatomic) IBOutlet UILabel *upLoadTimeLB;

@end


@implementation JSWeatherTopView

+ (JSWeatherTopView *)instance {
    return [[NSBundle mainBundle] loadNibNamed:@"JSWeatherTopView" owner:nil options:nil].firstObject;
}

- (void)reloadWeatherData:(WeatherModel *)weatherData {
    _weatherData = weatherData;
    
    _cityNameLB.text = weatherData.city;
    _dateLB.text = weatherData.date;
    _weekLB.text = weatherData.week;
    _weatherImgView.image = Img(weatherData.img);
    _weatherLB.text = weatherData.weather;
    _wenDuLB.text = [NSString stringWithFormat:@"%@°C",weatherData.temp];
    _high_LowTempLB.text = [NSString stringWithFormat:@"%@°C/%@°C",weatherData.temphigh,weatherData.templow];
    _upLoadTimeLB.text = [NSString stringWithFormat:@"更新时间：%@",weatherData.updatetime];
    
}


- (IBAction)changeCityAction:(id)sender {
    
    if (self.changeBlock) {
        self.changeBlock();
    }
    
}


@end
