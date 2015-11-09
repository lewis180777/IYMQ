//
//  XBBusinessManager.h
//  xiu8iOS
//
//  Created by XB on 15/9/10.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBBaseHttpRequestHelper.h"

@protocol XBBusinessManagerDelegate <NSObject>
@required
/**< 返回业务数据信息成功  */
- (void)XBBusinessDataFetchedSuccess:(id)data forAction:(NSString *)action andIdentifier:(NSString *)identifier;

/**< 返回业务数据信息失败  */
- (void)XBBusinessDataFetchedError:(NSError *)error forAction:(NSString *)action andIdentifier:(NSString *)identifier;
@optional
/**< 当且网络状态不可用  */
- (void)XBBusinessNetworkNotReachable;
/**< 当且网络状态切换为WWAN  */
- (void)XBBusinessNetworkChangedToWWAN;
@end

@interface XBBusinessManager : NSObject
@property (nonatomic,strong) id<XBBusinessManagerDelegate> delegate;       /**< */

/**
 *  **< 请求业务数据
 *  @param action    MoudleUrl
 *  @param requestType   请求类型 get or post
 *  @param params    参数
 *  @param deleage   回调接受者
 *  @param className 返回的数据解析类型(基于MJExtension),nil表示返回字典,否则返回class对应的模型
 */
+ (void)requestBusinessAction:(NSString *)action
                byRequestType:(XBHttpRequestType)requestType
                andParameters:(NSDictionary *)params
          andCallbackDelegate:(id)deleage
                  andDataType:(Class)dataClass andIdentifier:(NSString *)identifier;

+ (void)removeBusinessDelegate:(id)delegate;
@end
