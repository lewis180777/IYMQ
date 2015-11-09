//
//  UIColor+Category.h
//  Category
//
//  Created by Apple on 15/4/20.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

#define UIColorFromHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define UIColorFromHexRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:(a)]

#define DEFAULT_VOID_COLOR [UIColor clearColor];

typedef NS_ENUM(NSInteger, GradientOrientation)
{
    GradientOrientationTopToBottom = 0, //上往下
    GradientOrientationLeftToRight = 1  //左往右
};

@interface UIColor (Category)

/**
 * 获取到随机颜色
 */
+ (UIColor *)randomColor;

/**
 * 获取到随机颜色
 * 带透明度值
 */
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

/**
 * 根据16进制字符串(HTML颜色值)获取颜色
 * 比如：#FF9900、0XFF9900等
 * 默认透明度为1.0
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 * 根据16进制字符串(HTML颜色值)获取颜色，带透明度值
 * 比如：#FF9900、0XFF9900等
 * @param alpha 颜色透明度
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 * 根据RGB值获取颜色
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

/**
 * 根据RGBA值获取颜色
 * @param alpha 颜色透明度
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

/**
 * 获取渐变颜色
 * 从color1渐变到color2
 * @param value 渐变范围值
 * 默认从上往下渐变
 */
+ (UIColor *)gradientColorFromColor:(UIColor *)color1 toColor:(UIColor *)color2 value:(CGFloat)value;

/**
 * 获取随机渐变颜色
 * @param value 渐变范围值
 * @param orientation 渐变方向
 * 默认从上往下渐变
 */
+ (UIColor *)randomGradientColorWithValue:(CGFloat)value orientation:(GradientOrientation)orientation;

/**
 * 获取渐变颜色
 * 从color1渐变到color2
 * @param height 渐变高度
 * @param orientation 渐变方向
 */
+ (UIColor *)gradientColorFromColor:(UIColor *)color1 toColor:(UIColor *)color2 value:(CGFloat)value orientation:(GradientOrientation)orientation;

@end
