//
//  ADeanAppDelegate+Hook.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanMethodSwizzling.h"
#import "ADeanAppDelegate+Hook.h"

// 第三方库

#if TARGET_IPHONE_SIMULATOR

#else

#endif


#pragma mark -  Umeng AppKey
#pragma mark    友盟搜集健值
#define UMENG_APPKEY    @""
#define Crittercism_APPKEY @""

#pragma mark -  Map AppKey
#pragma mark    地图组件
#define GAODE_APPKEY   @""

#pragma mark -  Share Key
#pragma mark    分享组件

//ShareSDK
#define ShareSDKAppKey     @""
#define ShareSDKAppSecret  @""

//新浪微博
#define SinaAppKey         @""
#define SinaAppSecret      @""
#define SinaRedirectUri    @""

//QQ空间、QQ好友
#define QZoneAppKey        @""

//微信好友、朋友圈
#define  WeiXinAppID       @""
#define  WeiXinAppSecret   @""


@implementation AppDelegate (Hook)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self adean_AppDelegateHook];
    });
}

+ (void)adean_AppDelegateHook
{
    SwizzlingMethod([AppDelegate class], @selector(application:didFinishLaunchingWithOptions:), @selector(adean_application:didFinishLaunchingWithOptions:));
    SwizzlingMethod([AppDelegate class], @selector(application:handleOpenURL:), @selector(adean_application:handleOpenURL:));
    SwizzlingMethod([AppDelegate class], @selector(application:openURL:sourceApplication:annotation:), @selector(adean_application:openURL:sourceApplication:annotation:));
    SwizzlingMethod([AppDelegate class], @selector(applicationDidReceiveMemoryWarning:), @selector(adean_applicationDidReceiveMemoryWarning:));
    
}

#pragma mark - Method Swizzling
- (BOOL)adean_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        
    });
    
    return [self adean_application:application didFinishLaunchingWithOptions:launchOptions];
}


- (BOOL)adean_application:(UIApplication *)application handleOpenURL:(NSURL *)url
{

    return [self adean_application:application handleOpenURL:url];
}

- (BOOL)adean_application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [self adean_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

-  (void)adean_applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
    [self adean_applicationDidReceiveMemoryWarning:application];
}

#pragma mark
#pragma mark Other Action

@end
