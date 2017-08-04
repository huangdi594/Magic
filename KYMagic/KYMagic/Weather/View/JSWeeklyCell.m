//
//  JSWeeklyCell.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSWeeklyCell.h"

@interface JSWeeklyCell ()

@property (weak, nonatomic) IBOutlet UILabel *weekLb;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImgView;
@property (weak, nonatomic) IBOutlet UILabel *weatherLB;
@property (weak, nonatomic) IBOutlet UILabel *highLB;
@property (weak, nonatomic) IBOutlet UILabel *lowLB;


@end


@implementation JSWeeklyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(Daily *)model {
    
    _model = model;
    
    _weekLb.text = model.week;
    _weatherImgView.image = Img(model.day.img);
    _weatherLB.text = model.day.weather;
    _highLB.text = model.day.temphigh;
    _lowLB.text = model.night.templow;
    
}

@end
