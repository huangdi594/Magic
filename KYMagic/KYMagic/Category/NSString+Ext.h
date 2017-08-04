//
//  Constant.h
//  micro-love-ios
//
//  Created by Alion on 17/3/3.
//  Copyright © 2017年 Alion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Ext)

- (CGFloat)heightInTextViewWithSize:(CGSize)size andFont:(UIFont *)font;
- (CGFloat)heightInLabelWithSize:(CGSize)size andFont:(UIFont *)font;
- (CGFloat)widthWithFont:(UIFont *)font;
- (NSString *)md5String;


+ (BOOL)validateMobile:(NSString *)mobile;
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validatePassword:(NSString *)password;
+ (BOOL)validateUsername:(NSString *)username;
+ (BOOL)validateRealname:(NSString *)realname;
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
+ (BOOL)validateVerificationCode:(NSString *)verificationCode;
+ (BOOL)validateHttps:(NSString *)https;//是否是网址
+ (NSString *)timestampToDateString:(NSString *)datestamp;//yyyy年mm月dd日
+ (NSString *)timestampToDateString2:(NSString *)datestamp;//yyyy-mm-dd

- (NSMutableAttributedString *)setLineSpacingAttributedStringWithLineSpacing:(NSInteger )lineSpace;
- (NSMutableAttributedString *)setCenterLineSpacingAttributedStringWithLineSpacing:(NSInteger )lineSpace;//居中富文本
//时间戳转时间 // 时间戳转时间 yyyy-MM-dd HH:mm:ss
- (NSString *)timestampToDateString;
- (NSString *)priceSwift;

//判断字符串为纯数字
- (BOOL)isPureInt;
/** 判断字符串为浮点型*/
- (BOOL)isPureFloat;
@end
