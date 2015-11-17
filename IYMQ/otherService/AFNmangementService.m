//
//  AFNmangementService.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/17.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "AFNmangementService.h"
#import "ZPRequestService.h"


@implementation AFNmangementService

@synthesize delegate;
@synthesize isBGO;

 static AFNmangementService *AFNService = nil;

+ (AFNmangementService *)AFNService {
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!AFNService) {
            AFNService = [AFNmangementService new];
        }
    });
    
    return AFNService;

}


- (void)PostAFNRequestAction:(NSString *)action andParameters:(NSDictionary *)params andCallbackDelegate:(id)deleage isBGO:(BOOL)BGO andIdentifier:(NSString *)identifier {
    
    [AFNmangementService AFNService].isBGO = BGO;
    if (!BGO) { //提示框 no
        
        //网络请求时
        [ZPActivityView activityViewForView:[UIApplication sharedApplication].keyWindow  withLabel:@"正在为您加载...."];
    }
    [AFNmangementService AFNService].delegate = deleage;
    [XBBusinessManager requestBusinessAction:action byRequestType:XBHttpRequestTypePost andParameters:params andCallbackDelegate:self andDataType:nil andIdentifier:identifier];
}

- (void)GetAFNRequestAction:(NSString *)action andParameters:(NSDictionary *)params andCallbackDelegate:(id)deleage isBGO:(BOOL)BGO andIdentifier:(NSString *)identifier {
    
    [AFNmangementService AFNService].isBGO = BGO;
    if (!BGO) { //提示框 no
        //网络请求时
        [ZPActivityView activityViewForView:[UIApplication sharedApplication].keyWindow  withLabel:@"正在为您加载...."];
        
    }

    [AFNmangementService AFNService].delegate = deleage;
    [XBBusinessManager requestBusinessAction:action byRequestType:XBHttpRequestTypeGet andParameters:params andCallbackDelegate:self andDataType:nil andIdentifier:identifier];
}

#pragma - mark XBBusinessDelegate
/**< 返回业务数据信息成功  */
- (void)XBBusinessDataFetchedSuccess:(id)data forAction:(NSString *)action andIdentifier:(NSString *)identifier
{
    
    if ([AFNmangementService AFNService].isBGO == NO) { //移除显示
        //网络请求完成
        [ZPActivityView removeViewAnimated:YES];
    }
    
    NSDictionary *dict = (NSDictionary *)data;
    DLog(@"data===%@",dict);
    DLog(@"identifier===%@",identifier);
    
    
    
    if ([AFNmangementService AFNService].delegate && [delegate respondsToSelector:@selector(AFNmangementServiceFailure:andIdentifier:)]) {
        [[AFNmangementService AFNService].delegate AFNmangementServiceSuccesss:dict  andIdentifier:identifier];
    }

}

/**< 返回业务数据信息失败  */
- (void)XBBusinessDataFetchedError:(NSError *)error forAction:(NSString *)action andIdentifier:(NSString *)identifier
{
    if ([AFNmangementService AFNService].isBGO == NO) { //移除显示
        //网络请求完成
        [ZPActivityView removeViewAnimated:YES];
    }

    DLog(@"error===%@",error);
    DLog(@"identifier===%@",identifier);
    
    if ([AFNmangementService AFNService].delegate && [delegate respondsToSelector:@selector(AFNmangementServiceFailure:andIdentifier:)]) {
        [[AFNmangementService AFNService].delegate AFNmangementServiceFailure:error andIdentifier:identifier];
    }
    
}

/**< 无网络  */
- (void)XBBusinessNetworkNotReachable
{
    DLog(@"网络断开");
}
/**< 使用手机流量  */

- (void)XBBusinessNetworkChangedToWWAN
{
    DLog(@"使用手机流量");
    
}


@end
