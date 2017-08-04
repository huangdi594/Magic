//
//  UIButton+Category.h
//  haitao
//
//  Created by Yuen-iMac on 16/5/4.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    
    ButtonPaddingTypeImageRight = 0,
    ButtonPaddingTypeCenterImageTop = 1,
    ButtonPaddingTypeCenterTitleTop = 2
}ButtonPaddingType;

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    <#top description#>
 *  @param right  <#right description#>
 *  @param bottom <#bottom description#>
 *  @param left   <#left description#>
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

//设置图片离左边的距离
-(float)imageLeft;
-(void)setImageLeft:(float)imageLeft;

//设置文字离左边的距离
-(float)titleLeft;
-(void)setTitleLeft:(float)titleLeft;

//设置文字居中
-(float)titleCenter;
-(void)setTitleCenter;

//设置图片在文字右边
-(void)setimageToTitleRight;


//设置图片和文字都居中，图片在上,padding为图片跟文字的间距
-(void)setImageAndTitleCenterImageTopWithpadding:(float)padding;

//设置图片和文字都居中，文字在上,padding为图片跟文字的间距
-(void)setImageAndTitleCenterTitleTopWithpadding:(float)padding;

/**
 *  @brief  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
