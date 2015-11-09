//
//  XBBaseHttpRequestHelper.m
//  xiu8iOS
//
//  Created by 张淼 on 15/9/9.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import "XBBaseHttpRequestHelper.h"
#import "AFNetworking.h"
static AFHTTPRequestOperationManager *_httpManager;

@implementation XBBaseHttpRequestHelper

+ (AFHTTPRequestOperationManager *)httpManager
{
    if (!_httpManager) {
        _httpManager = [AFHTTPRequestOperationManager manager];
    }
    return _httpManager;
}

+ (void)cancelAllOperation
{
    [[self httpManager].operationQueue cancelAllOperations];
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{

    [[self httpManager] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary*responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
        
    }];
    
}

+ (void)post:(NSString *)url params:(id)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
        
    [[self httpManager] POST:url  parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}
@end
