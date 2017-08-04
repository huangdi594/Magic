//
//  JSWeatherHeaderView.m
//  KYMagic
//
//  Created by ky_mini on 2017/8/2.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSWeatherHeaderView.h"
#import "JSWeatherHourlyCell.h"

@interface JSWeatherHeaderView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation JSWeatherHeaderView

+ (JSWeatherHeaderView *)instance {
    return [[NSBundle mainBundle] loadNibNamed:@"JSWeatherHeaderView" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.hourlyCollectionView.delegate = self;
    self.hourlyCollectionView.dataSource = self;
    
    [self.hourlyCollectionView registerNib:[UINib nibWithNibName:@"JSWeatherHourlyCell" bundle:nil] forCellWithReuseIdentifier:@"JSWeatherHourlyCell"];
    
}

-(void)reloadHourlyDatas:(NSArray *)hourlys {
    
    self.hourlys = hourlys;
    
    [self.hourlyCollectionView reloadData];
    
}


/* UICollectionViewDelegate,UICollectionViewDataSource */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hourlys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JSWeatherHourlyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSWeatherHourlyCell" forIndexPath:indexPath];
    
    if (self.hourlys.count > 0) {
        Hourly * model = self.hourlys[indexPath.row];
        cell.model = model;
    }
    
    
    return cell;
}


@end
