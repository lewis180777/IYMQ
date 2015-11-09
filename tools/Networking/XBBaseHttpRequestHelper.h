//
//  XBBaseHttpRequestHelper.h
//  xiu8iOS
//
//  Created by 张淼 on 15/9/9.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBNetworkingParam.h"

@interface XBBaseHttpRequestHelper : NSObject


+ (void)get:(NSString *)url params:(id)param success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;


+ (void)post:(NSString *)url params:(id)param success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

+ (void)cancelAllOperation;

@end
