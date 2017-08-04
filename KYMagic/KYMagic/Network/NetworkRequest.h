//
//  NetworkRequest.h
//  JQD
//
//  Created by jyLiu on 16/8/10.
//  Copyright © 2016年 JY_L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface NetworkRequest : NSObject
//请求成功的回调
typedef void(^SuccessBlock)(id responseObject);

//请求失败的回调
typedef void(^FailBlock)(NSError * error);

//进度的回调
typedef void (^ProgressBlock)(double progress);
//发送GET
+ (void)sendGETWithUrl:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSString *errorStr))failure;

//发送PST
+(void)sendPOSTHttpWithUrl:(NSString *)url parameters:(id)parameters success:(void (^)(id responseObject))success  failure:(void (^)(NSString *errorStr))failure;
//文件上传
+(void)uploadImageApi:(NSString *)URLString
           parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>  formData))block
              success:(void (^)(id responseObject))success
              failure:(void (^)( NSString *errorStr))failure;


//文件下载
//下载
+(void)downLoadWithUrl:(NSString *)url
              progress:(ProgressBlock)progress
               success:(SuccessBlock)success
                  fail:(FailBlock)fail;
@end
