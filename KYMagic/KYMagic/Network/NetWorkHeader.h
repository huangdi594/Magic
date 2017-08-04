//
//  NetWorkHeader.h
//  Template
//
//  Created by XuHuan on 2017/5/22.
//  Copyright © 2017年 KingYon. All rights reserved.
//

#ifndef NetWorkHeader_h
#define NetWorkHeader_h

#define ServerHost              @""
#define Server_Login            @""



#pragma mark - 接口地址
/*   -- 用户模块 --   */

/* 绑定设备号 */
#define BandingDeviceIDURL @"/rest/consumer/bandingDeviceID"
//修改我的密码
#define ChangePassWordURL  @"/rest/consumer/changePassword"
//设置二级密码
#define ChangeSecondPassWordURL   @"/rest/consumer/changeSecondPassword"
//设置二级密码获取短信验证码校验
#define CheckChangeSecondPassWordCodeURL   @"/rest/consumer/checkChangeSecondPasswordCode"
//忘记密码验证码校验
#define CheckResetPassCodeURL   @"/rest/consumer/checkResetpassCode"
/* 校验二级密码正确性 */
#define CheckSecondPasswordURL @"/rest/consumer/checkSecondPassword"
/* 检查二级密码设置状态（是否设置） */
#define CheckSecondPasswordStatusURL @"/rest/consumer/checkSecondPasswordStatus"
//用户登陆
#define LoginURL       @"/rest/consumer/login"
//用户登出
#define LogoutURL      @"/rest/consumer/logout"
//登陆后获取个人信息
#define MyInfoURL      @"/rest/consumer/myInfo"
//用户注册
#define RegistryURL    @"/rest/consumer/registry"
//重置密码
#define ResetPassURL   @"/rest/consumer/resetPass"
//设置二级密码获取短信验证码
#define SendChangeSecondPassWordCodeURL @"/rest/consumer/sendChangeSecondPasswordCode"
//用户注册获取验证码
#define SendRegistCodeURL  @"/rest/consumer/sendRegistCode"
//忘记密码获取验证码
#define SendResetPassCodeURL @"/rest/consumer/sendResetpassCode"
//登陆后修改个人信息
#define UpdateMyInfoURL  @"/rest/consumer/updateMyinfo"
//查看指定用户基本信息
#define getAccountBaseInfo @"/rest/account/getAccountBaseInfo"



/*   -- 消息模块 --   */
//根据id获取消息详情
#define MessageDetailURL @"/rest/message/detail"
//根据消息类型获取当前登陆用户消息列表
#define MessageListURL @"/rest/message/list"
//查看当前是否有未读消息
#define HasNotReadURL @"/rest/message/hasNotRead"
//根据类型获取当前登录用户未读消息条数
#define NotReadURL @"/rest/message/notRead"



/*   --------- 评论模块 ---------   */
/*   -- 根据问答或者文章id获取评论列表 --   */
#define CommentListURL @"/rest/knowledge/comment/list"
/*   -- 根据ID查看动态--   */
#define userBehavior @"/rest/socialContact/userBehavior"

/*   --------- 订单管理模块 ---------   */
/*   -- 支付宝下单 --   */
#define AddAlipayOrderURL @"/rest/order/addAlipayOrder"
/*   -- 微信下单 --   */
#define AddWeChatOrderURL @"/rest/order/addWeChatOrder"
/*   -- 银联下单 --   */
#define AddUnionpayOrderURL @"/rest/order/addUnionpayOrder"
/*   -- 订单列表 --   */
#define OrderList @"/rest/order/list"
/*   -- 取消订单 --   */
#define cancelOrder @"/rest/order/cancel"

/*   -- 订单详情 --   */
#define Orderdetail @"/rest/order/detail"

/*   -- 支付宝支付订单 --   */
#define payAliay @"/rest/order/payAliay"
/*   -- 微信支付订单 --   */
#define payWeChat @"/rest/order/payWeChat"


/*   --------- 社交模块 ---------   */
/*   -- 收藏 --   */
#define LikeURL @"/rest/socialContact/like"
/*   -- 我的收藏—问答 --   */
#define MyLikeQuestionListURL @"/rest/socialContact/myLike"
/*   -- 对评论点赞 --   */
#define PraiseURL @"/rest/socialContact/praise"
/*   -- 取消收藏 --   */
#define RemoveLikeURL @"/rest/socialContact/removeLike"



/*   --------- 在线反馈 模块 ---------   */
/*   -- 发送在线反馈 --   */
#define AddFeedBackURL @"/rest/feedback/addFeedback"
/*   -- 获取我的反馈记录明细 --   */
#define GetFeedBackInfoURL @"/rest/feedback/getFeedbackInfo"
/*   -- 获取我的反馈记录列表 --   */
#define GetFeedBackListURL @"/rest/feedback/getFeedbackList"



/*   --------- 消息模块 ---------   */
/*   -- 根据id获取消息详情 --   */
#define MessageDetailURL @"/rest/message/detail"
/*   -- 根据消息类型获取当前登录用户消息列表 --   */
#define MessageListURL  @"/rest/message/list"
/*   -- 根据类型获取当前登录用户未读消息条数 --   */
#define NotReadMsgUnmberURL @"/rest/message/notRead"


/*   --------- 文件上传模块 ---------   */
/*   -- 上传临时文件(上传多个时中间用 , 隔开) --   */  //😑
#define UploadFilesURL @"/rest/attachment/upload/files"

/*   -- 上传用户头像 --   */
#define UpdateAccountHead @"/rest/account/updateAccountHead"

/*   -- 绑定极光推送的账号 --   */
#define BindPushIdURL @"/rest/account/bindPushId"







#define BASE_URL @"http://jisutqybmf.market.alicloudapi.com/"


// 内部测试地址   http://192.168.0.122:8099
// 外网地址   http://app.zzcfo.cn
// 蔡佩君     http://192.168.0.16:8082


//http://119.23.106.240:8082
//http://119.23.31.110:8082
//外网 http://119.23.31.110:8082


#define Token  @"TOKEN 46/6873f736-38e4-4174-a6c8-73f5c644b3e3"





#endif /* NetWorkHeader_h */
