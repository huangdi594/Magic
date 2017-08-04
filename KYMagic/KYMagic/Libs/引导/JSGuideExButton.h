//
//  JSGuideExButton.h
//  KYMagic
//
//  Created by ky_mini on 2017/7/28.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSGuideExButton;
typedef void(^tapAction)(JSGuideExButton *senderButton);

@interface JSGuideExButton : UIButton

/**按钮文字*/
@property (nonatomic, strong) UILabel *buttonTitleLable;
/**按钮图片*/
@property (nonatomic, strong) UIImageView *buttonImageView;

- (void)setTitleOriginX:(CGFloat)x sizeWidth:(CGFloat)width;
- (void)setImageOriginX:(CGFloat)x sizeWidth:(CGFloat)width;

- (void)setTitleCenterWithWidth:(CGFloat)width;
- (void)setImageCenterWithWidth:(CGFloat)width;

- (void)setTitleFrame:(CGRect)frame;
- (void)setImageFrame:(CGRect)frame;

/**点击事件*/
- (void)tapAction:(tapAction)action;

@end
