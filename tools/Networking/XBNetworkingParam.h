//
//  XBNetworkingParam.h
//  xiu8iOS
//  底层网络请求封装
//  第三方类库封装,降低对第三方类库的依赖
//  Created by 张淼 on 15/9/9.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, XBHttpRequestType)
{
    XBHttpRequestTypeGet,
    XBHttpRequestTypePost,
};
//网络状态
#define NetworkNotReachable @"NetworkNotReachable"
#define NetworkViaWWAN @"NetworkViaWWAN"

#define XBHOST     @"这里填入服务器地址"
/**< 首页标签列表  */
#define XBHomeTagList @"这里填入接口路径"

