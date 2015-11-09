//
//  NSString+MCString.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

@interface NSString (MCString)

/**
 *  把含中文字符的地址进行URL编码
 *
 *  @param str 将要进行URL编码的字符串
 *
 *  @return 已编码成功的字符串
 */
+(NSString*)urlEncode:(NSString *)str;

/**
 *  把含中文字符的URL转换为地址
 *
 *  @param str 将要进行转换的URL字符串
 *
 *  @return 已转换的地址
 */
+(NSString*)urlDecode:(NSString*)str;

/**
 *  判断邮件格式是否正常
 *
 *  @param email 将要判断的邮箱字符串
 *
 *  @return YES：正确，NO：不正确
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *  手机号码验证，以1开头的11位数均为手机号码
 *
 *  @param mobile 要验证的字符串
 *
 *  @return YES：是手机号码，NO：不是手机号码
 */
+ (BOOL)validateMobile:(NSString *)mobile;

/**
 *  中英文混合字数统计
 *
 *  @param strtemp 要统计的字符串
 *
 *  @return 字符串所站的位数
 */
+ (int)wordCountToInt:(NSString*)strtemp;

/**
 *  获取当前设备ip地址
 *
 *  @return 设备ip地址
 */
+ (NSString *)getIPAddress;

/**
 *  判断字符串是否为空
 *
 *  @param string 要判断的字符串
 *
 *  @return YES：空的，NO：不为空
 */
+ (BOOL)isEmptyString:(NSString *)string;

/**
 *  指定宽度、字体，计算文本的高度
 *
 *  @param text 字符串
 *  @param wide 文本的宽度
 *  @param font 文本的字体
 *
 *  @return 文本的高度
 */
+ (CGFloat)contentCellHeightWithText:(NSString*)text WithWidth:(CGFloat)width WithFont:(UIFont *)font;

/**
 *  指定高度、字体，计算文本的宽度
 *
 *  @param text 字符串
 *  @param wide 文本的高度
 *  @param font 文本的字体
 *
 *  @return 文本的宽度
 */
+ (CGFloat)contentCellWidthWithText:(NSString*)text WithHeight:(CGFloat)height WithFont:(UIFont *)font;
/**
 *  判断一个点是否在三角形局域里面
 *
 *  @param point  判断的点
 *  @param point1 三角形的一个顶点
 *  @param point2 三角形的一个顶点
 *  @param point3 三角形的一个顶点
 *
 *  @return YES：包含在三角形里；NO：不包含在三角形里
 */
+ (BOOL)contentOfPoint:(CGPoint)point WithPoint1:(CGPoint)point1 WithPoint2:(CGPoint)point2 WithPoint3:(CGPoint)point3;
@end
