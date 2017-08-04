//
//  Constant.h
//  micro-love-ios
//
//  Created by Alion on 17/3/3.
//  Copyright © 2017年 Alion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Ext)
/**
 *  如果结果为空  则返回空字符串@""
 *
 *  @param key key
 *
 *  @return id
 */
- (id)valueForKeyNullToString:(NSString *)key;

//json 转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
