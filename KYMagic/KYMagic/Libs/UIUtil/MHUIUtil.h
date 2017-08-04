//
//  MHUIUtil.h
//  YHSL
//
//  Created by MH on 16/10/18.
//  Copyright © 2016年 MH. All rights reserved.
//

#import <Foundation/Foundation.h>

#if NS_BLOCKS_AVAILABLE
typedef void (^completeBlock)(BOOL Susscess);

typedef void (^alertBlock)();
#endif


@interface MHUIUtil : NSObject

#pragma mark --- 根据数字得到大写字母，A从0开始
+(NSString *)uppercaseLettersFromIndex:(NSUInteger)index;

#pragma mark --- 用来计时的工具类，比如某些需要24小时只能执行最多一次，但必须保证返回yes一定要执行
+(BOOL)timeInterval:(NSString *)key withTime:(NSUInteger)seconds;

#pragma mark --- 每天首次执行
+(BOOL)everyDayFirstExecute:(NSString *)key;

+(NSString *)timeFormat:(NSDate *)date;

#pragma mark --- 检测是否在wifi条件下
+(BOOL)isWifi;

#pragma mark --- 检测银行卡是否正确
+(BOOL)checkCardNo:(NSString*)cardNo;

#pragma mark --- 判断是不是数字
+(BOOL)isPureInt:(NSString *)string;

#pragma mark --- 是否含有中文
+(BOOL)hasCH:(NSString *)s;

#pragma mark --- 是否是邮箱
+(BOOL)isValidateEmail:(NSString *)email;

#pragma mark --- 是否是身份证
+(BOOL)isValidateIdentityCard:(NSString *)identityCard;

#pragma mark --- 获得中间带*隐藏身份证号(18位)
+ (NSString*)getIDCard:(NSString*)idCard;

#pragma mark --- 手机号隐藏后四位
+(NSString *)phoneDisplay:(NSString *)phone;

#pragma mark --- 是否为手机号
+(BOOL)isValidatePhone:(NSString *)phone;

#pragma mark --- 去除字符串中的空格
+ (NSString *)nonemptyString:(NSString *)firstString;

#pragma mark --- MD5加密
+(NSString *) md5: (NSString *) inPutText;

#pragma mark --- 有逗号分割的金钱
+(NSString *)moneyStringWithFloat:(float)money;

#pragma mark --- 截图
+(UIImage *)imageWithView:(UIView *)view withOffset:(CGFloat)offset;


#pragma mark --- 图片变黑白
+(UIImage *)convertToGreyscale:(UIImage *)i;

#pragma mark --- 颜色生产图片
+ (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark --- 获取边框不变 拉伸的图片
+(UIImage *)getResizableImageWithImage:(UIImage*)image Insets:(UIEdgeInsets)insets;

#pragma mark --- 通过url获取高度
+(CGFloat)picHeightForViewWithObject:(NSString *)url columnWidth:(CGFloat)columnWidth minHeight:(float)pictureMinHeight maxHeight:(float)pictureMaxHeight;

#pragma mark --- 获取中间空格的银行卡字符串
+ (NSString*)getBankName:(NSString*)bankName;

#pragma mark --- 获取中间带*的银行卡号
+ (NSString*)getBankCard:(NSString*)bankCard;

#pragma mark --- 为空
+ (BOOL) isEmptyStr:(NSString *)str;

#pragma mark --- 不为空
+ (BOOL) isNoEmptyStr:(NSString *)str;

#pragma mark --- 类似安卓toast效果显现
+ (void) alert:(NSString*)message;

+ (void) alert:(NSString*)message image:(UIImage*)image;

#pragma mark --- 获取目标时间 （分段）
+ (NSString *)prettyDateWithReference:(NSDate *)reference;

+ (NSString *)prettyDateNoChangeWithReference:(NSDate *)reference setDateFormat:(NSString *)dateFormat;

#pragma mark ---  获取当前时间毫秒值
+ (NSString *)getNowDateMillisecond;

#pragma mark --- 通过毫秒值获得时间戳
+ (NSString*)getTime:(long long)time isHms:(BOOL)isHms;

#pragma mark --- 通过秒值获得时间戳
+ (NSString *)getTimeR:(NSString*)time;

#pragma mark --- 数组去重
+ (NSMutableArray *)arrayWithMemberIsOnly:(NSMutableArray *)array;


#pragma mark --- 获取唯一标示
+ (NSString *)getUniqueStrByUUID;

#pragma mark - **************** 计算视频大小
+ (CGFloat)fileSize:(NSURL *)path;

#pragma mark - **************** 限制输入
+ (BOOL)isValidateWithKey:(NSString *)key Num:(int)num;


+ (UIAlertController *)showAlertViewControllerWithSuperController:(UIViewController * )superController Title:(NSString*)title Message:(NSString*)message SureStr:(NSString*)sureStr CancelStr:(NSString*)cancelStr actionBlock:(alertBlock)customBlock;

#pragma mark - **************** 获取图片的类型
+ (NSString *)typeForImageData:(NSData *)data;

#pragma mark - **************** 改变某段字符串的颜色
+ (NSMutableAttributedString*)changeColor:(UIColor*)color String:(NSString*)string Font:(CGFloat)font Range:(NSRange)range;
@end
