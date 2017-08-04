//
//  JSWeatherHourlyCell.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSWeatherHourlyCell.h"

@interface JSWeatherHourlyCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImgView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLB;


@end


@implementation JSWeatherHourlyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(Hourly *)model {
    _model = model;
    
    _timeLB.text = model.time;
    _weatherLB.text = [NSString stringWithFormat:@"%@°",model.temp];
    _weatherImgView.image = Img(model.img);
    
    
}

@end
