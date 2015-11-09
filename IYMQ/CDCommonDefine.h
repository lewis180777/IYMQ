//
//  CDCommonDefine.h
//  CDCommonDefine
//
//  Created by Apple on 15/4/24.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

/**
 *  导入头文件
 *
 *
 *
 *
 */
#import "UIView+Category.h"
#import "CoreAnimationEffect.h"   //动画
#import "UIColor+HEX.h"
#import "ZPRequestService.h"      //加载指示图
#import "UIButton+Block.h"
#import "UILabel+ESAdjustableLabel.h"
#import "Masonry.h"               //适配
#import "RETableViewManager.h"    //tableView
#import "RETableViewItem.h"
#import "RETableViewCell.h"
#import "UIColor+Chameleon.h"     //颜色框架
#import "TTTAttributedLabel.h"



/**
 * 项目总单例
 */
#import "AppDelegate.h"
#define ProjectAPP ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/**
 * 屏幕的尺寸、宽高度
 */
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size

#define SCREEN_WIDTH  SCREEN_SIZE.width

#define SCREEN_HEIGHT SCREEN_SIZE.height

/**
 * 在block中使用
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define weakSELF __typeof (&*self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

/**
 * 沙盒路路径
 */
#define DocumentsPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

/**
 * 调试模式使用，打印日志
 * 打印方法名、所在行、内容
 */
#ifdef DEBUG
#   define CDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define CDLog(...)
#endif

/**
 * 导航栏高度（iOS7）
 */
#define NavBar_Height 64.0

/**
 * 动画默认持续时间
 */
#define AnimateDuration 0.25

/**
 * 黄金比例值
 */
#define GP_VALUE 0.618

/**
 * 判断当前设备是否为iPad
 */
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 * 根据屏幕分辨率获取iPhone设备类型
 * iPhone5、iPhone5C、iPhone5S、iPhone6像素密度一样
 * iPhone4S和iPhone6P相对特殊一些
 */
#define iPhone4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0, 960.0), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080.0, 1920.0), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 * 获取系统版本
 * IOS_VERSION 得到的是数字类型
 * CurrentSystemVersion 得到的是字符串类型
 */
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

/**
 * 获取当前语言
 */
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

/**
 * 读取本地图片
 * LOCAL_IMAGE_T 用图片类型和名称读取
 * LOCAL_IMAGE_N 用图片文件名读取
 */
#define LOCAL_IMAGE_T(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

#define LOCAL_IMAGE_N(filename) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:filename ofType:nil]]

/**
 * 获取颜色
 */
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define UIColorFromRGB(R,G,B) UIColorFromRGBA(R,G,B,1.0)

/**
 * NSUserDefaults 实例化
 */
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

/**
 * GCD线程
 * BackgroundThreadPerformBlock 子线程运行block
 * MainThreadPerformBlock 主线程运行block
 * DelayMainThreadPerformBlock 主线程中延时secs秒后运行block
 */
#define BackgroundThreadPerformBlock(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define MainThreadPerformBlock(block) dispatch_async(dispatch_get_main_queue(),block)

#define DelayMainThreadPerformBlock(block,secs) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, secs * NSEC_PER_SEC), dispatch_get_main_queue(), block)

/**
 * 检查系统版本，并与给定的某个值进行比较
 * SYSTEM_VERSION_EQUAL_TO                  等于
 * SYSTEM_VERSION_GREATER_THAN              大于
 * SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO  大于或等于
 * SYSTEM_VERSION_LESS_THAN                 小于
 * SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO     小于或等于
 */
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
