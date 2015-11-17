//
//  AFNmangementService.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/17.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XBBusinessManager.h"


@protocol AFNmangementServiceDelegate <NSObject>

@optional
- (void)AFNmangementServiceSuccesss:(NSDictionary *)infoDict andIdentifier:(NSString *)identifier;
- (void)AFNmangementServiceFailure:(NSError *)error andIdentifier:(NSString *)identifier;

@end


@interface AFNmangementService : NSObject<XBBusinessManagerDelegate>

@property (nonatomic,weak) id<AFNmangementServiceDelegate> delegate;
@property (nonatomic,assign) BOOL isBGO;  //是否后台，不是有提示框  默认no




/**
 *  创建一个单例
 *
 *  @return AFNmangementService
 */
+ (AFNmangementService *)AFNService;

/**
 *  POST方式
 *
 *  @param action     action地址
 *  @param params     post数据
 *  @param deleage    代理
 *  @param BGO        是否后台执行
 *  @param identifier 标示接口
 */
- (void)PostAFNRequestAction:(NSString *)action andParameters:(NSDictionary *)params andCallbackDelegate:(id)deleage isBGO:(BOOL)BGO andIdentifier:(NSString *)identifier;

/**
 *  GET方式
 *
 *  @param action     action地址
 *  @param params     post数据
 *  @param deleage    代理
 *  @param BGO        是否后台执行
 *  @param identifier 标示接口
 */
- (void)GetAFNRequestAction:(NSString *)action andParameters:(NSDictionary *)params andCallbackDelegate:(id)deleage isBGO:(BOOL)BGO andIdentifier:(NSString *)identifier;

@end
