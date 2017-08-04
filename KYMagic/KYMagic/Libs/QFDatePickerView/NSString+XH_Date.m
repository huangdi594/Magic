//
//  NSString+XH_Date.m
//  Template
//
//  Created by XuHuan on 2017/7/7.
//  Copyright © 2017年 KingYon. All rights reserved.
//


#import "NSString+XH_Date.h"

#define DEFAULT_FORMATTER @"yyyy-MM"

@implementation NSString (XH_Date)


+ (NSString *)stringOfDate:(NSDate *)date {
    if (!date) {
        date = [NSDate date]; //[NSDate getPriousorLaterDateFromDate:[NSDate date] withMonth:-1];
    }
    return [self stringOfDate:date formatter:DEFAULT_FORMATTER];
}

+ (NSString *)stringOfDate:(NSDate *)date formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringOfDateString:(NSString *)dates formatter:(NSString *)formatter periodType:(NSInteger)periodType {
    
    if (periodType == 0) {
        return dates;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter ? : DEFAULT_FORMATTER;
    
    NSDate *date = [dateFormatter dateFromString:dates];
    int month = periodType == 1 ? -1 : -12;
    NSDate *newDate = [NSDate getPriousorLaterDateFromDate:date withMonth:month];
    
    return [dateFormatter stringFromDate:newDate];
}



@end
