//
//  NetworkRequest.m
//
//
//  Created by jyLiu on 16/8/10.
//  Copyright © 2016年 JY_L. All rights reserved.
//

#import "NetworkRequest.h"

static NSDictionary *appServiceCodeDictionary=nil;

@implementation NetworkRequest


+(void)uploadImageApi:(NSString *)URLString
           parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>  formData))block
              success:(void (^)(id responseObject))success
              failure:(void (^)( NSString *errorStr))failure {
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [self requestHeader:session];
    
//    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [session POST:[BASE_URL stringByAppendingString:URLString] parameters:parameters constructingBodyWithBlock:block progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *str = [NetworkRequest returnCodeStringWithDictionary:responseObject];
        if ([str isEqualToString:@"success"]) {
            success(responseObject);
        }
        else{
            if ([str isEqualToString:@"用户未登录"] || [str isEqualToString:@"用户被禁用"]) {
                [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"login"];
                [[NSUserDefaults standardUserDefaults] setObject:@"用户未登录" forKey:@"被挤下来了"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"没登录" object:nil];
                
                [kNotificationCenter postNotificationName:@"Logout" object:nil];
                
                [UserModel Logout];
            
                
            }
            
            
            NSString * error = responseObject[@"message"];

            
            failure(error);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败原因 == %@", error);
        failure(@"网络或服务器异常");
    }];
    
}

 + (void)sendGETWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    NSLog(@"%@",parameters);
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 60.f;
    [self requestHeader:session];
    [session GET:[BASE_URL stringByAppendingString:url] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *str = [NetworkRequest returnCodeStringWithDictionary:responseObject];
        if ([str isEqualToString:@"success"]) {
            success(responseObject);
        }
        else{
            if ([str isEqualToString:@"用户未登录"] || [str isEqualToString:@"用户被禁用"]) {
                [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"login"];
                [[NSUserDefaults standardUserDefaults] setObject:@"用户未登录" forKey:@"被挤下来了"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"没登录" object:nil];
                
                [kNotificationCenter postNotificationName:@"Logout" object:nil];
                
                [UserModel Logout];
                
            }
            
            NSString * error = responseObject[@"message"];
            
            failure(error);
        }

        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(error.localizedDescription);
    }];

}



+(void)sendPOSTHttpWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success  failure:(void (^)(NSString *errorStr))failure{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 60.f;
    [self requestHeader:session];
    
    [session POST:[BASE_URL stringByAppendingString:url] parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        NSString *str = [NetworkRequest returnCodeStringWithDictionary:responseObject];
        if ([str isEqualToString:@"success"]) {
            success(responseObject);
        } else{
            if ([str isEqualToString:@"用户未登录"] || [str isEqualToString:@"用户被禁用"]) {
                [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"login"];
                [[NSUserDefaults standardUserDefaults] setObject:@"用户未登录" forKey:@"被挤下来了"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"没登录" object:nil];
                
                [kNotificationCenter postNotificationName:@"Logout" object:nil];
                
                [UserModel Logout];
                
                
               //跳转到登录页
             
            }
            
            NSString * error = responseObject[@"message"];
            
            failure(error);
        }
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error.localizedDescription);
         NSLog(@"%@",error);
    }];
}

//下载
+(void)downLoadWithUrl:(NSString *)url
              progress:(ProgressBlock)progress
               success:(SuccessBlock)success
                  fail:(FailBlock)fail{
    //默认传输的数据类型是二进制
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //构造request对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //使用系统类创建downLoad Task对象
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //下载进度
        if (progress) {
            progress(downloadProgress.fractionCompleted);//完成的百分比
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //拼接存放路径
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        
        //返回下载到哪里(返回值是一个路径)
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //此处已经在主线程了
        if (!error){
            
            //文件名称
            NSString *fileName = filePath.lastPathComponent;
            //沙盒documents路径
            NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
            //文件路径
            NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsPath,fileName];
            
            NSData *dataURL = [NSData dataWithContentsOfFile:filePath];
            
            if (success) {
                success(dataURL);
            }
            //如果请求没有错误(请求成功), 则打印地址
            NSLog(@"打印地址-->%@", filePath);
        }else{
            
            if (fail) {
                fail(error);
            }
        }
    }];
    //开始请求
    [task resume];

}


//解析 返回状态码
+(NSString *)returnCodeStringWithDictionary:(NSDictionary *)responseObject{
    NSString *codeSt;
    id code = [responseObject objectForKey:@"status"];
    if ([code isKindOfClass:[NSNumber class]]) {
        codeSt = [NSString stringWithFormat:@"%@",code];
    }else{
        codeSt = (NSString *)code;
    }
    //状态码 对应值使用文件 方便管理 替换之前switch case 方案
    codeSt = [[NetworkRequest getAppCode] objectForKey:codeSt];
    return codeSt;
}
/**获取状态码 字典*/
+(NSDictionary *)getAppCode{
    if (!appServiceCodeDictionary) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"httpCode" ofType:@"plist"];
        appServiceCodeDictionary = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    }
    return appServiceCodeDictionary;
}



+(void)requestHeader:(AFHTTPSessionManager *)manager{
    
   // [manager.requestSerializer setValue:@"1.0" forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:@"APPCODE 7ff40839d6c44bda841c2e43877c86d2"  forHTTPHeaderField:@"Authorization"];
    NSString * token  = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSLog(@"TOKEN -- %@",token);
    if(token && token.length > 0){
        NSString * uuid = [UUID getUUID];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
        [manager.requestSerializer setValue:uuid forHTTPHeaderField:@"deviceId"];
        [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"deviceType"];
        NSLog(@"deviceId -- %@",uuid);
        
    }
    
}


@end
