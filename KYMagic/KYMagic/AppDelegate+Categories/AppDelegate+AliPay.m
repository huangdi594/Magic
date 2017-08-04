//
//  AppDelegate+AliPay.m
//  Template
//
//  Created by 陶一平 on 2017/6/22.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#import "AppDelegate+AliPay.h"



@implementation AppDelegate (AliPay)

//ios 9以前
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([url.host isEqualToString:@"safepay"]) {
        [self handAlipayResult:url];
    }else  if ([url.host isEqualToString:@"pay"]){
        return [WXApi handleOpenURL:url delegate:self];
    }
    return YES;
}

-(void)onResp:(BaseResp*)resp
{
    //启动微信支付的response
    NSString *payResoult = [NSString stringWithFormat:@"%d", resp.errCode];
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case 0:
                payResoult = @"支付成功!";
                [kNotificationCenter postNotificationName:@"payResult" object:payResoult];
                break;
            case -1:
                payResoult = @"支付失败!";
                [kNotificationCenter postNotificationName:@"payResult" object:payResoult];
                break;
            case -2:
                payResoult = @"你已退出支付";
                [kNotificationCenter postNotificationName:@"payResult" object:payResoult];
                break;
            default:
                
                break;
        }
    }
}




- (void)handAlipayResult:(NSURL*)url{
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService]processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"支付宝返回结果%@",resultDic);
            //支付宝支付通知回调
            [kNotificationCenter postNotificationName:@"aliPayInfo" object:resultDic];
        }];
    }
}

-(BOOL) verify:(NSString *) resultStr {
    
    //此处的verify，商户需送去商户后台做验签
    return NO;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
          [self handAlipayResult:url];//跳转到支付宝
        
    }else  if ([url.host isEqualToString:@"pay"]){
        return [WXApi handleOpenURL:url delegate:self];
    }else{
       /* [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
            
            if([code isEqualToString:@"success"]) {
                
                //如果想对结果数据验签，可使用下面这段代码，但建议不验签，直接去商户后台查询交易结果
                if(data != nil){
                    //数据从NSDictionary转换为NSString
                    NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                                       options:0
                                                                         error:nil];
                    
                    NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
                    
                    //此处的verify建议送去商户后台做验签，如要放在手机端验，则代码必须支持更新证书
                    if([self verify:sign]) {
                        //验签成功
                        NSLog(@"success");
                    }
                    else {
                        //验签失败
                        NSLog(@"fail");
                    }
                }
                
                //结果code为成功时，去商户后台查询一下确保交易是成功的再展示成功
            }
            else if([code isEqualToString:@"fail"]) {
                //交易失败
            }
            else if([code isEqualToString:@"cancel"]) {
                //交易取消
            }
        }];*/
    }
    return YES;
}
@end
