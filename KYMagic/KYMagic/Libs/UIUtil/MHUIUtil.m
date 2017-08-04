//
//  MHUIUtil.m
//  YHSL
//
//  Created by MH on 16/10/18.
//  Copyright © 2016年 MH. All rights reserved.
//

#import "MHUIUtil.h"
#import <UIKit/UIKit.h>
#import "TKAlertCenter.h"
#import <CommonCrypto/CommonDigest.h>
#import "Reachability.h"
#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

static NSDateFormatter *dayFormatter = nil;
@implementation MHUIUtil

+(NSString *)uppercaseLettersFromIndex:(NSUInteger)index{
    char c = (char)(65+index);
    return [NSString stringWithFormat:@"%c",c];
}


+(BOOL)timeInterval:(NSString *)key withTime:(NSUInteger)seconds{
    NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if(date){
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:date];
        if(interval < seconds){
            return NO;
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}


+(BOOL)everyDayFirstExecute:(NSString *)key{
    NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if(date){
        NSString *oldDay = [self timeFormat:date];
        NSString *nowDay = [self timeFormat:[NSDate date]];
        if([oldDay isEqualToString:nowDay]){
            return NO;
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}


+(NSString *)timeFormat:(NSDate *)date{
    if(dayFormatter == nil){
        dayFormatter = [[NSDateFormatter alloc] init];
        [dayFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dayFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dayFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dayFormatter setDateFormat:@"yyyy.MM.dd"];
    }
    return [dayFormatter stringFromDate:date];
}


+(BOOL)isWifi{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == ReachableViaWiFi){
        return YES;
    }
    return NO;
}

+(BOOL)checkCardNo:(NSString*)cardNo{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

+(BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

+(BOOL)hasCH:(NSString *)s{
    for(int i=0; i<s.length; i++){
        if(IS_CH_SYMBOL([s characterAtIndex:i])){
            return YES;
        }
    }
    return NO;
}


+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(BOOL)isValidateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (NSString*)getIDCard:(NSString*)idCard{
    NSString * IDCard = @"";
    idCard = [idCard stringByReplacingOccurrencesOfString:@" " withString:@""];
    idCard = [NSString stringWithFormat:@"%@********%@",[idCard substringToIndex:7],[idCard substringFromIndex:13]];
    IDCard = idCard;
    return IDCard;
}

+(BOOL)isValidatePhone:(NSString *)phone{
    NSString* rule = @"(^(13\\d|14[57]|15[^4,\\D]|17[678]|18\\d)\\d{8}|170[059]\\d{7})$";
    NSPredicate* pred=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",rule];
    BOOL isMatch=[pred evaluateWithObject:phone];
    return isMatch;
}

+(NSString *)phoneDisplay:(NSString *)phone{
    if (phone.length != 11) {
        return @"";
    }
    NSString *string = [NSString stringWithFormat:@"%@****%@",[phone substringWithRange:NSMakeRange(0, 3)],[phone substringWithRange:NSMakeRange(7, 4)]];
    return string;
}


+ (NSString *)nonemptyString:(NSString *)firstString{
    if ([firstString length] && [[firstString stringByReplacingOccurrencesOfString:@" " withString:@""] length]) {
        return firstString;
    }
    return @"";
}


+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+(NSString *)moneyStringWithFloat:(float)money{
    NSString * initMoney = @"";
    if (money<0) {
        initMoney = [NSString stringWithFormat:@"%f",money];
        initMoney = [NSString stringWithFormat:@"%@",[initMoney stringByReplacingOccurrencesOfString:@"-" withString:@""]];
        money = [initMoney floatValue];
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSString *returnValue = [formatter stringFromNumber:[NSNumber numberWithFloat:money]];
    if (initMoney.length>0) {
        return [NSString stringWithFormat:@"-%@元",[returnValue substringWithRange:NSMakeRange(1, returnValue.length-1)]];
    }else{
        return [NSString stringWithFormat:@"%@元",[returnValue substringWithRange:NSMakeRange(1, returnValue.length-1)]];
    }
}

//+(NSString *)appendWebImageSuffix:(NSString *)url withSuffix:(NSString *)qiniusuffix{
//    if([url hasPrefix:qiniu_image_prefix] && [url rangeOfString:@"?imageView2/2/w"].location == NSNotFound){
//        return [url stringByAppendingString:qiniusuffix];
//    }
//    return url;
//}
//
//+(NSString *)removeWebImageSuffix:(NSString *)url{
//    url = [url stringByReplacingOccurrencesOfString:qiniu_image_prefix withString:@""];
//    return url;
//}


+(UIImage *)imageWithView:(UIView *)view withOffset:(CGFloat)offset
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, 0, offset);
    [view.layer renderInContext:ctx];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}



+(UIImage *)convertToGreyscale:(UIImage *)i{
    int kRed = 1;
    int kGreen = 2;
    int kBlue = 4;
    
    int colors = kGreen;
    int m_width = i.size.width;
    int m_height = i.size.height;
    
    uint32_t *rgbImage = (uint32_t *) malloc(m_width * m_height * sizeof(uint32_t));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImage, m_width, m_height, 8, m_width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, m_width, m_height), [i CGImage]);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // now convert to grayscale
    uint8_t *m_imageData = (uint8_t *) malloc(m_width * m_height);
    for(int y = 0; y < m_height; y++) {
        for(int x = 0; x < m_width; x++) {
            uint32_t rgbPixel=rgbImage[y*m_width+x];
            uint32_t sum=0,count=0;
            if (colors & kRed) {sum += (rgbPixel>>24)&255; count++;}
            if (colors & kGreen) {sum += (rgbPixel>>16)&255; count++;}
            if (colors & kBlue) {sum += (rgbPixel>>8)&255; count++;}
            m_imageData[y*m_width+x]=sum/count;
        }
    }
    free(rgbImage);
    
    // convert from a gray scale image back into a UIImage
    uint8_t *result = (uint8_t *) calloc(m_width * m_height *sizeof(uint32_t), 1);
    
    // process the image back to rgb
    for(int i = 0; i < m_height * m_width; i++) {
        result[i*4]=0;
        int val=m_imageData[i];
        result[i*4+1]=val;
        result[i*4+2]=val;
        result[i*4+3]=val;
    }
    
    // create a UIImage
    colorSpace = CGColorSpaceCreateDeviceRGB();
    context = CGBitmapContextCreate(result, m_width, m_height, 8, m_width * sizeof(uint32_t), colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    
    free(m_imageData);
    
    // make sure the data will be released by giving it to an autoreleased NSData
    [NSData dataWithBytesNoCopy:result length:m_width * m_height];
    
    return resultUIImage;
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)getResizableImageWithImage:(UIImage*)image Insets:(UIEdgeInsets)insets{
    // 伸缩后重新赋值
    image = [image resizableImageWithCapInsets:insets];
    return image;
}

+(CGFloat)picHeightForViewWithObject:(NSString *)url columnWidth:(CGFloat)columnWidth minHeight:(float)pictureMinHeight maxHeight:(float)pictureMaxHeight
{
    NSArray *splitUrl = [url componentsSeparatedByString:@"/"];
    float picWidth;
    float picHeight;
    if(splitUrl.count > 1){
        NSString *whString = [splitUrl objectAtIndex:splitUrl.count-2];
        NSArray *whArray = [whString componentsSeparatedByString:@"x"];
        picWidth = [whArray.firstObject floatValue];
        if (picWidth == 0 || whArray.count < 2) {
            picHeight = pictureMinHeight;
        }else{
            if(picWidth < 0.05*columnWidth){
                return 0;
            }
            picHeight = MIN(pictureMaxHeight, [whArray.lastObject floatValue]/picWidth*columnWidth) ;
        }
    }else{
        picHeight = pictureMinHeight;
    }
    return picHeight;
}




+ (NSString*)getBankName:(NSString*)bankName{
    NSString * BankName = @"";
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789*\b"];
    bankName = [bankName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([bankName rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return nil;
    }
    
    NSString *newString = @"";
    while (bankName.length > 0) {
        NSString *subString = [bankName substringToIndex:MIN(bankName.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        bankName = [bankName substringFromIndex:MIN(bankName.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    // 限制长度
    if (newString.length >= 24) {
        return nil;
    }
    BankName = newString;
    return BankName;
}

+ (NSString*)getBankCard:(NSString*)bankCard{
    NSString * IDCard = @"";
    bankCard = [bankCard stringByReplacingOccurrencesOfString:@" " withString:@""];
    bankCard = [NSString stringWithFormat:@"%@ **** **** %@",[bankCard substringToIndex:4],[bankCard substringFromIndex:12]];
    IDCard = bankCard;
    return IDCard;
}





+ (BOOL) isEmptyStr:(NSString *)str {
    return ( str==nil || [@"" isEqualToString:[MHUIUtil trim:str]] );
}

+ (BOOL) isNoEmptyStr:(NSString *)str {
    return ( str!=nil && [MHUIUtil trim:str].length>0 );
}

+ (NSString *) trim:(NSString *)str {
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


+ (void)alert:(NSString*)message
{
    [[TKAlertCenter defaultCenter] postAlertWithMessage:message];
}

+ (void)alert:(NSString*)message image:(UIImage*)image
{
    [[TKAlertCenter defaultCenter] postAlertWithMessage:message image:image];
}


+ (NSString *)prettyDateWithReference:(NSDate *)reference {
    NSString *suffix = @"之前";
    
    float different = [reference timeIntervalSinceDate:[NSDate date]];
    if (different < 0) {
        different = -different;
        suffix = @"前";
    }
    
    // days = different / (24 * 60 * 60), take the floor value
    float dayDifferent = floor(different / 86400);
    
    int days   = (int)dayDifferent;
    
    
    if (dayDifferent <= 0) {
        if (different < 15*60) {
            return @"刚刚";
        }
        
        if (different < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟%@", (int)(different / 60), suffix];
        }
        
        if (different < 86400) {
            return [NSString stringWithFormat:@"%d小时%@", (int)(different / 3600), suffix];
        }
        
        
    }
    else if (days < 7) {
        return [NSString stringWithFormat:@"%d天%@", days, suffix];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:reference];
    
    return destDateString;
}


+ (NSString *)prettyDateNoChangeWithReference:(NSDate *)reference setDateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *destDateString = [dateFormatter stringFromDate:reference];
    
    return destDateString;
}

+ (NSString *)getNowDateMillisecond
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;  //  *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    return timeString;
}

+ (NSString*)getTime:(long long)time  isHms:(BOOL)isHms{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (isHms) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    NSDate * d = [NSDate dateWithTimeIntervalSince1970:time/1000.0];
    NSString * str = [dateFormatter stringFromDate:d];
    return str;
}


+ (NSString *)getTimeR:(NSString*)time{
    // 获取分钟
    NSString *min = [NSString stringWithFormat:@"%02d",[time intValue] / 60];
    // 获取秒数
    NSString *sec = [NSString stringWithFormat:@"%02d",[time intValue] % 60];
    return [NSString stringWithFormat:@"时长： %@分:%@秒", min, sec];
}

+ (NSMutableArray *)arrayWithMemberIsOnly:(NSMutableArray *)array{
    NSMutableArray *categoryArray = [NSMutableArray array];
    for (int i = 0; i < [array count]; i++){
        
        if ([categoryArray containsObject:[array objectAtIndex:i]] == NO){
            
            [categoryArray addObject:[array objectAtIndex:i]];
        }
    }
    return categoryArray;
}


+ (NSString *)getUniqueStrByUUID {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStrRef= CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *retStr = [NSString stringWithString:(__bridge NSString *)uuidStrRef];
    CFRelease(uuidStrRef);
    return retStr;
}


+ (CGFloat)fileSize:(NSURL *)path
{
    return [[NSData dataWithContentsOfURL:path] length]/1024.00 /1024.00;
}

+ (BOOL)isValidateWithKey:(NSString *)key Num:(int)num{
    NSUInteger  character = 0;
    NSUInteger  hanzi = 0;
    for(int i=0; i< [key length];i++){
        int a = [key characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){ //判断是否为中文
            character +=2;
            hanzi +=1;
        }else{
            character +=1;
        }
    }
    //个数
//    if (character >=1 && character <=num+hanzi) {
//        return YES;
//    }else{
//        return NO;
//    }
    
    //字符
    if (character <= num) {
        return YES;
    }else{
        return NO;
    }
    
}

+ (UIAlertController *)showAlertViewControllerWithSuperController:(UIViewController * )superController Title:(NSString*)title Message:(NSString*)message SureStr:(NSString*)sureStr CancelStr:(NSString*)cancelStr actionBlock:(alertBlock)customBlock{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: title message: message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction: [UIAlertAction actionWithTitle:sureStr style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        customBlock();
    }]];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:nil];
    [cancelAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [alertController addAction:cancelAction];
    [superController presentViewController: alertController animated: YES completion: nil];
    return alertController;
}


+ (NSString *)typeForImageData:(NSData *)data {
    
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    
    
    switch (c) {
            
        case 0xFF:
            
            return @"image/jpeg";
            
        case 0x89:
            
            return @"image/png";
            
        case 0x47:
            
            return @"image/gif";
            
        case 0x49:
            
        case 0x4D:
            
            return @"image/tiff";
            
    }
    
    return nil;
    
}

+ (NSMutableAttributedString*)changeColor:(UIColor*)color String:(NSString*)string Font:(CGFloat)font Range:(NSRange)range{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeStr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font], NSForegroundColorAttributeName : color} range:range];
    return attributeStr;
}

@end
