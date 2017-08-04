//
//  NSDate+XH_Category.m
//  Template
//
//  Created by XuHuan on 2017/7/11.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "NSDate+XH_Category.h"

@implementation NSDate (XH_Category)

+ (NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    
    return mDate;
    
}

@end
