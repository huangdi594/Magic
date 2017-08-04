//
//  Constant.h
//  micro-love-ios
//
//  Created by Alion on 17/3/3.
//  Copyright © 2017年 Alion. All rights reserved.
//

#import "NSString+Ext.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSObject+Util.h"

@implementation NSString (Ext)

- (CGFloat)heightInTextViewWithSize:(CGSize)size andFont:(UIFont *)font {
    CGSize expectedSize = CGSizeZero;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    expectedSize = [self boundingRectWithSize:CGSizeMake(size.width - 16.f, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes
                                      context:nil].size;
    
    return ceil(expectedSize.height + 16.f);
}

- (CGFloat)heightInLabelWithSize:(CGSize)size andFont:(UIFont *)font {
    CGSize expectedSize = CGSizeZero;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    expectedSize = [self boundingRectWithSize:CGSizeMake(size.width, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes
                                      context:nil].size;
    
    return ceil(expectedSize.height);
}

- (CGFloat)widthWithFont:(UIFont *)font {
    CGSize expectedSize = CGSizeZero;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    expectedSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.f)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes
                                      context:nil].size;
    
    return ceil(expectedSize.width);
}

- (NSString *)md5String {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}
+ (BOOL)validateHttps:(NSString *)https{
     NSString *httpStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSPredicate *httpPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", httpStr];
    return [httpPredicate evaluateWithObject:https];
}
+ (BOOL)validateMobile:(NSString *)mobile{
    NSString *phoneRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phonePredicate evaluateWithObject:mobile];
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSString *emailRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*.\\w+([-.]\\w+)*$";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:email];
}

+ (BOOL)validatePassword:(NSString *)password
{
    NSString *passwordRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";//@"^[A-Za-z0-9\x21-\x7e]{6,20}+$";
    NSPredicate *passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordPredicate evaluateWithObject:password];
}

+ (BOOL)validateUsername:(NSString *)username
{
    NSString *usernameRegex = @"^[A-Za-z0-9_]{6,20}+$";
    NSPredicate *usernamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", usernameRegex];
    return [usernamePredicate evaluateWithObject:username];
}

+ (BOOL)validateRealname:(NSString *)realname
{
    NSString *realnameRegex = @"^([\u4e00-\u9fa5]{2,7}|([a-zA-Z]+\\s?){3,20})$";
    NSPredicate *realnamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", realnameRegex];
    return [realnamePredicate evaluateWithObject:realname];
}

+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    NSString *identityCardRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", identityCardRegex];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)validateVerificationCode:(NSString *)verificationCode
{
    NSString *verificationCodeRegex = @"^[0-9]{6}$";
    NSPredicate *verificationCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verificationCodeRegex];
    return [verificationCodePredicate evaluateWithObject:verificationCode];
}


/**
 *  调整行间距
 *
 *  @param lineSpace 行间距
 *
 *  @return 经过设置行间距的富文本
 */
- (NSMutableAttributedString *)setLineSpacingAttributedStringWithLineSpacing:(NSInteger )lineSpace
{
    // 调整行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [titleParagraphStyle setLineSpacing:lineSpace];
    titleParagraphStyle.alignment = NSTextAlignmentJustified;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:titleParagraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

/**
 居中富文本

 @param lineSpace <#lineSpace description#>
 @return <#return value description#>
 */
- (NSMutableAttributedString *)setCenterLineSpacingAttributedStringWithLineSpacing:(NSInteger )lineSpace
{
    // 调整行间距
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    [titleParagraphStyle setLineSpacing:lineSpace];
    titleParagraphStyle.alignment = NSTextAlignmentCenter;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:titleParagraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

- (NSString *)timestampToDateString
{
    if (![self isNotNull] || [self isEqualToString:@"0"] || [self isEqualToString:@""]) {
        return @"";
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    NSLocale* local =[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale: local];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]/1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

- (NSString *)priceSwift
{
    NSString * nowPrice;
    double priceDouble = [self doubleValue]/100;
    int priceInt = priceDouble;
    if (priceInt == priceDouble) {
        nowPrice = [NSString stringWithFormat:@"%d",priceInt];
    }
    else
    {
        nowPrice = [NSString stringWithFormat:@"%.2f",priceDouble];
    }
    return nowPrice;
}


+ (NSString *)timestampToDateString:(NSString *)datestamp{
    if (![datestamp isNotNull] || [datestamp isEqualToString:@"0"]) {
        return @"";
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    NSLocale* local =[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale: local];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[datestamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
}
+ (NSString *)timestampToDateString2:(NSString *)datestamp{
    if (![datestamp isNotNull] || [datestamp isEqualToString:@"0"]) {
        return @"";
    }
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    NSLocale* local =[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale: local];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[datestamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
}

//判断字符串为纯整数
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
//判断字符串为浮点型
- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
