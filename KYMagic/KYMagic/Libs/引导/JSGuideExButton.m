//
//  JSGuideExButton.m
//  KYMagic
//
//  Created by ky_mini on 2017/7/28.
//  Copyright © 2017年 ky_mini. All rights reserved.
//

#import "JSGuideExButton.h"
#import "UIView+LBExtension.h"

@interface JSGuideExButton ()

@property (nonatomic, strong) tapAction tapButtonAction;

@end

@implementation JSGuideExButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self setImage];
        self.backgroundColor = RGBA(254,246,80, 1);
        
    }
    return self;
}

- (void)setImage
{
    self.buttonImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.buttonImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.buttonImageView];
    
    self.buttonTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.buttonTitleLable.backgroundColor = [UIColor clearColor];
    self.buttonTitleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.buttonTitleLable];
    
    [self addTarget:self action:@selector(didClickedButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitleFrame:(CGRect)frame
{
    self.buttonTitleLable.frame = frame;
}

- (void)setImageFrame:(CGRect)frame
{
    self.buttonImageView.frame = frame;
}

- (void)setTitleOriginX:(CGFloat)x sizeWidth:(CGFloat)width
{
    self.buttonTitleLable.frame = CGRectMake(x, 0, width, self.size.height);
}

- (void)setImageOriginX:(CGFloat)x sizeWidth:(CGFloat)width
{
    self.buttonImageView.frame = CGRectMake(x, self.size.height/2.0 - width/2.0, width, width);
}

- (void)setTitleCenterWithWidth:(CGFloat)width
{
    self.buttonTitleLable.frame = CGRectMake(self.size.width/2.0 - width/2.0, 0, width, self.size.height);
}

- (void)setImageCenterWithWidth:(CGFloat)width
{
    self.buttonImageView.frame = CGRectMake(self.size.width/2.0 - width/2.0, self.size.height/2.0 - width/2.0, width, width);
}

- (void)didClickedButtonAction:(JSGuideExButton *)sender
{
    if (self.tapButtonAction) {
        self.tapButtonAction(sender);
    }
}
- (void)tapAction:(tapAction)action
{
    if (!action) return;
    
    self.tapButtonAction = action;
}

@end
