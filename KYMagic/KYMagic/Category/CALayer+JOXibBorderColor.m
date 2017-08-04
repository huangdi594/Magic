//
//  CALayer+JOXibBorderColor.m
//  Template
//
//  Created by ky_mini on 2017/6/4.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "CALayer+JOXibBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (JOXibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)color
{
    
    self.borderColor = color.CGColor;
}

@end
