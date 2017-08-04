//
//  NSString+XH_Date.h
//  Template
//
//  Created by XuHuan on 2017/7/7.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XH_Date)
/**
*yyyy-MM 
*date 传nil 返回当月
*/
+ (NSString *)stringOfDate:(NSDate *)date;

+ (NSString *)stringOfDate:(NSDate *)date formatter:(NSString *)formatter;
/**
 * formatter 传nil 使用默认yyyy-MM
 * periodType 0本期 1上期 2同期
 */
+ (NSString *)stringOfDateString:(NSString *)dates formatter:(NSString *)formatter periodType:(NSInteger)periodType;

@end
