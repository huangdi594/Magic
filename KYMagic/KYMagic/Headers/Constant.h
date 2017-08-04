#ifndef Constant_h

#define Constant_h

//----------------------------------第三方账号AppKey-----------------------------------------
/* 微信 */
#define WeChatAPPID @""
#define WeChatAppSecret @""

/* 微博 */
#define WeiBoAppSecret @""
#define WeiBoAppKey @""
#define WeiBoRedirectUri @""

/* QQ */
#define QQAPPID @""
#define QQAppSecret @""

/*-- 极光推送 --*/
#define JPushAppKey @""
#define JPushNotAppStory @"" //App发布渠道(个人版)

/*-- 友盟 --*/
#define UMengAPPKey @""



//----------------------------------尺寸宏定义-----------------------------------------
//设备尺寸
#define StatusBar_HEIGHT            20
#define NavigationBar_HEIGHT        44
#define NavigationBarIcon           20
#define TabBar_HEIGHT               49
#define TabBarIcon                  30

#define SegmentViewHeight           40

#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height

#define IS_IPHONE4                  SCREEN_HEIGHT==480
#define IS_IPHONE5                  SCREEN_HEIGHT==568
#define IS_IPHONE6                  SCREEN_HEIGHT==667
#define IS_IPHONE6PS                SCREEN_HEIGHT==736

#define SCREEN_SCALE_RATE           SCREEN_WIDTH/375
#define SCREEN_W_RATE               SCREEN_WIDTH/375
#define SCREEN_H_RATE               ((IS_IPHONE6)?(1.0):(SCREEN_HEIGHT/667))
#define SCREEN_HALFSCALE_RATE       (1.0 + ((int)((int)(SCREEN_SCALE_RATE*100)%100)/200.0))

//由角度转换弧度
#define kDegreesToRadian(x)        (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian)   (radian * 180.0) / (M_PI)


//----------------------------------缓存文件夹路径-----------------------------------------
//获取沙盒Document路径
#define Path_Document               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define Path_Temp                   NSTemporaryDirectory()
//获取沙盒Cache路径
#define Path_Cache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



//----------------------------------通知-----------------------------------------




//----------------------------------色值&字体-----------------------------------------
// 色值
#define RGB(r, g, b)                [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define RGBA(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define RGBRrom16Hex(rgbValue)      [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBRrom16HexAlpha(rgbValue,a)      [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define Color_Theme                 RGBRrom16Hex(0xffffff)
#define Color_SeparateLine          RGBRrom16Hex(0xffffff)
#define Color_Random                RGB(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

#define TableViewSpeColor           [UIColor groupTableViewBackgroundColor]


#define MainColor                   [UIColor redColor]



//字体大小
#define Font_bold(a)                [UIFont boldSystemFontOfSize:a]
#define Font_System(a)              [UIFont systemFontOfSize:a]

#define Img(a)                      [UIImage imageNamed:a]


//----------------------------------单例宏-----------------------------------------

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

//----------------------------------多线程宏-----------------------------------------

//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


//----------------------------------其他-----------------------------------------
//弱引用
#define WS(weakSelf)                __weak __typeof(&*self)weakSelf = self;

#define kApplication            [UIApplication sharedApplication]
#define kKeyWindow              [UIApplication sharedApplication].keyWindow
#define kAppDelegate            [UIApplication sharedApplication].delegate
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]

//开发的时候打印，但是发布的时候不打印的NSLog
#ifdef DEBUG
#define NSLog(...)               NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

//字符串是否为空
#define kStringIsEmpty(str)      ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array)     (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic)        (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object)  (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//APP版本号
#define kAppVersion            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion         [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define kCurrentLanguage       ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define kISiPhone              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define kISiPad                (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//UUID保存相关
#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"
#define  KEY_USERNAME @"com.company.app.username"
#define  KEY_PASSWORD @"com.company.app.password"


#endif /* Constant_h */
