//
//  AppDelegate+XBNetworkingMonitor.m
//  XBBusinessManagerDemo
//
//  Created by Scarecrow on 15/9/26.
//  Copyright (c) 2015年 XB. All rights reserved.
//

#import "AppDelegate+XBNetworkingMonitor.h"
#import "AFNetworkReachabilityManager.h"
#import "XBNetworkingParam.h"
@implementation AppDelegate(XBNetworkingMonitor)

- (void)startMonitor
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NetworkNotReachable object:nil];
        }
        else if (status == AFNetworkReachabilityStatusReachableViaWWAN)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:NetworkViaWWAN object:nil];
        }
    }];

}

@end
