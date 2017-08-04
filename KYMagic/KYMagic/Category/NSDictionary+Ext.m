//
//  Constant.h
//  micro-love-ios
//
//  Created by Alion on 17/3/3.
//  Copyright © 2017年 Alion. All rights reserved.
//

#import "NSDictionary+Ext.h"
#import "NSObject+Util.h"

@implementation NSDictionary (Ext)
- (id)valueForKeyNullToString:(NSString *)key {
    id obj = [self valueForKey:key];
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%ld", [obj longValue]];
    }
    
    if (![obj isNotNull]) {
        return @"";
    }
    return obj;
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
