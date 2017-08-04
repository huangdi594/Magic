//
//  UIView+Layout.m
//  NEW-自主项目
//
//  Created by 陶一平 on 16/10/16.
//  Copyright © 2016年 陶一平. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)
@dynamic adjust_X;
@dynamic adjust_Y;
@dynamic adjust_Width;
@dynamic adjust_Height;
@dynamic adjust_CenterX;
@dynamic adjust_CenterY;

- (void)setAdjust_X:(CGFloat)adjust_X{
    CGRect frame = self.frame;
    frame.origin.x = adjust_X;
    self.frame = frame;
}
- (CGFloat)adjust_X{
    return self.frame.origin.x;
}

- (void)setAdjust_Y:(CGFloat)adjust_Y{
    CGRect frame = self.frame;
    frame.origin.y = adjust_Y;
    self.frame = frame;
}
- (CGFloat)adjust_Y{
    return self.frame.origin.y;
}
- (void)setAdjust_Width:(CGFloat)adjust_Width{
    CGRect frame = self.frame;
    frame.size.width = adjust_Width;
    self.frame = frame;
}
- (CGFloat)adjust_Width{
    return self.frame.size.width;
}
- (void)setAdjust_Height:(CGFloat)adjust_Height{
    CGRect frame = self.frame;
    frame.size.height = adjust_Height;
    self.frame = frame;
}
- (CGFloat)adjust_Height{
    return self.frame.size.height;
}
- (void)setAdjust_CenterX:(CGFloat)adjust_CenterX{
    CGPoint center = self.center;
    center.x = adjust_CenterX;
    self.center = center;
}
- (CGFloat)adjust_CenterX{
    return self.center.x;
}
- (void)setAdjust_CenterY:(CGFloat)adjust_CenterY{
    CGPoint center = self.center;
    center.y = adjust_CenterY;
    self.center = center;
}
- (CGFloat)adjust_CenterY{
    return self.center.y;
}
@end
