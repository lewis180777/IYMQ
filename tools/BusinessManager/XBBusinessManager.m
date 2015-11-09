//
//  XBBusinessManager.m
//  xiu8iOS
//
//  Created by XB on 15/9/10.
//  Copyright (c) 2015年 xiu8. All rights reserved.
//

#import "XBBusinessManager.h"
#import "MJExtension.h"

static XBBusinessManager *_manager;

@interface XBBusinessManager()
@property (nonatomic,copy) NSString *identifier;

@end

@implementation XBBusinessManager

#pragma - mark lifecycle
- (instancetype)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noNetwork) name:NetworkNotReachable object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useWWAN) name:NetworkViaWWAN object:nil];
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)businessManager {
    
    _manager = [[self alloc]init];    
    return _manager;
}

#pragma - mark Call XBBusinessManagerDelegate
+ (void)requestBusinessAction:(NSString *)action
                byRequestType:(XBHttpRequestType)requestType
                andParameters:(NSDictionary *)params
          andCallbackDelegate:(id)deleage
                  andDataType:(Class)dataClass andIdentifier:(NSString *)identifier;
{
    XBBusinessManager *manager = [self businessManager];
    manager.identifier = identifier;
    [manager requestBusinessAction:action byRequestType:requestType andParameters:params andCallbackDelegate:deleage andDataType:dataClass];
    
}

+ (void)removeBusinessDelegate:(id)delegate
{
    _manager.delegate = nil;
    [XBBaseHttpRequestHelper cancelAllOperation];
}

- (void)noNetwork
{
    if ([self.delegate respondsToSelector:@selector(XBBusinessNetworkNotReachable)]) {
        [self.delegate XBBusinessNetworkNotReachable];
    }
}

- (void)useWWAN
{
    if ([self.delegate respondsToSelector:@selector(XBBusinessNetworkChangedToWWAN)]) {
        [self.delegate XBBusinessNetworkChangedToWWAN];
    }
}


#pragma  - mark Call HttpHelper
- (void)requestBusinessAction:(NSString *)action
                byRequestType:(XBHttpRequestType)requestType
                andParameters:(NSDictionary *)params
                andCallbackDelegate:(id)deleage
                andDataType:(Class)dataClass
{
    
    self.delegate = deleage;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",XBHOST,action];
    
    [self logRequestUrlWithAction:action andParams:params];
    
    switch (requestType) {
        case XBHttpRequestTypeGet:
            [self get:urlStr params:params dataType:dataClass forAction:action];
            break;
        case XBHttpRequestTypePost:
            [self post:urlStr params:params dataType:dataClass forAction:action];
            break;
        default:
            NSLog(@"requestTyep unSupported!");
            break;
    }
}

- (void)get:(NSString *)urlStr params:(NSDictionary *)params dataType:(Class)dataClass forAction:action
{
    [XBBaseHttpRequestHelper get:urlStr params:params success:^(id result) {
        if ([self.delegate respondsToSelector:@selector(XBBusinessDataFetchedSuccess:forAction:andIdentifier:)]) {
            
            if (dataClass) {
                [self.delegate XBBusinessDataFetchedSuccess:[dataClass objectArrayWithKeyValuesArray:result] forAction:action andIdentifier:self.identifier];
            }else
            {
                [self.delegate XBBusinessDataFetchedSuccess:result forAction:action andIdentifier:self.identifier];

            }

        }
    } failure:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(XBBusinessDataFetchedError:forAction:andIdentifier:)]) {
            [self.delegate XBBusinessDataFetchedError:error forAction:action andIdentifier:self.identifier];
        }
    }];

}

- (void)post:(NSString *)urlStr params:(NSDictionary *)params dataType:(Class)dataClass forAction:action
{
    [XBBaseHttpRequestHelper post:urlStr params:params success:^(id result) {
        if ([self.delegate respondsToSelector:@selector(XBBusinessDataFetchedSuccess:forAction:andIdentifier:)]) {
            if (dataClass) {
                [self.delegate XBBusinessDataFetchedSuccess:[dataClass objectArrayWithKeyValuesArray:result] forAction:action andIdentifier:self.identifier];
            }else
            {
                [self.delegate XBBusinessDataFetchedSuccess:result forAction:action andIdentifier:self.identifier];
                
            }
        }
    } failure:^(NSError *error) {
        if ([self.delegate respondsToSelector:@selector(XBBusinessDataFetchedError:forAction:andIdentifier:)]) {
            [self.delegate XBBusinessDataFetchedError:error forAction:action andIdentifier:self.identifier];
        }
    }];

}

#pragma - mark selfMethod
- (void)logRequestUrlWithAction:(NSString *)action andParams:(NSDictionary *)params
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",XBHOST,action];
    NSArray *allkeys = [params allKeys];
    NSMutableString *paramsString = [NSMutableString string];
    for (int i=0; i<allkeys.count; i++) {
        NSString *key = [allkeys objectAtIndex:i];
        NSString *value = [params objectForKey:key];
        if (i == allkeys.count-1) {
            [paramsString appendFormat:@"%@=%@",key,value];
        }else{
            [paramsString appendFormat:@"%@=%@&",key,value];
        }
    }
    
    if (paramsString.length > 0) {
        urlStr = [urlStr stringByAppendingString:paramsString];
    }
    NSLog(@"请求地址为:%@",urlStr);
}


@end
