//
//  UserModel.h
//  EasyFrame_iOS2.0
//
//  Created by MH on 16/5/25.
//  Copyright © 2016年 MH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LoginNotificationFromLogin @"LoginNotificationFromLogin"
#define LogoutNotificationFromLogout @"LogoutNotificationFromLogout"

#define EFUserModel @"EFUserModel"

@class Region,Head;
@interface UserModel : NSObject
//用户信息接口获取
@property (nonatomic, strong) NSString * birthday;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, assign) NSString * objectId;
@property (nonatomic, strong) Region   * region;
@property (nonatomic, strong) NSString * signature;

@property (nonatomic, strong) NSString * realName;//当前认证姓名
@property (nonatomic, strong) NSString * identity;// 当前认证身份证号

//登录接口获取
@property (nonatomic, assign) BOOL       buyService;
@property (nonatomic, assign) BOOL       approved;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * token;

@property (nonatomic, strong) Head     * head;

@property (nonatomic, assign) BOOL       isLogin;

@property (nonatomic, assign) BOOL       hasUnReadMsg; //是否有未读消息
@property (nonatomic, assign) BOOL       hasEnterSecondPassWord; //是否已验证二级密码
@property (nonatomic, assign) BOOL       isSettedSecondPassWord; //是否设置了二级密码
@property (nonatomic, assign) BOOL       isHasServiceManager;    //是否有服务管家
@property (nonatomic, assign) BOOL       isBuyService;           //是否购买服务
@property (nonatomic, assign) BOOL       isFormHotQuestion;      //是否从首页热门问答跳转
@property (nonatomic, strong) NSArray * companyInfo;//公司信息

@property (nonatomic, strong) NSString * buySerivceInfo;//已购买服务公司信息


@property (nonatomic, strong) NSString * orderStatus;//订单支付状态







+ (UserModel *)ShareUserModel;
+ (void)Logout;
+ (void)LoginWithModel:(NSDictionary *)_dic andToken:(NSString *)token;
+ (void)SaveUserModel;
- (NSDictionary *)getUserModel;
@end

@interface Region : NSObject
@property (nonatomic, assign) NSInteger cityId;
@property (nonatomic, assign) NSInteger provinceId;
@property (nonatomic, assign) NSInteger regionId;
@property (nonatomic, copy)   NSString * address;
@end

@interface Head : NSObject

@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * objectId;

@end

