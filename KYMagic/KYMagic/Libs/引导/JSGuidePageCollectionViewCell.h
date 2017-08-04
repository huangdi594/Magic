//
//  JSGuidePageCollectionViewCell.h
//  KYMagic
//
//  Created by ky_mini on 2017/7/28.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSGuideExButton.h"

@class JSGuideExButton;
@interface JSGuidePageCollectionViewCell : UICollectionViewCell
/**滚动图片*/
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGFloat startHeight;
@property (nonatomic, strong) UIViewController *toController;
@property (nonatomic, strong) JSGuideExButton *startButton;
@property (nonatomic, strong) NSString *imageNameStr;

/**
 *  判断当前页码和最后一个页码
 *
 *  @param currentPage 当前页码
 *  @param lastIndex   最后一个页码
 */
- (void)setCurrentPageIndex:(NSInteger)currentPage lastPageIndex:(NSInteger)lastIndex;


@end
