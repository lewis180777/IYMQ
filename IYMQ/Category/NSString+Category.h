//
//  NSString+Category.h
//  Category
//
//  Created by Apple on 15/4/17.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 * 判断是否为空白String
 */
-(BOOL)isBlank;

/**
 * 判断是否为有效的String
 */
-(BOOL)isValid;

/**
 * 去掉String中的空白字符
 */
- (NSString *)removeWhiteSpacesFromString;

/**
 * 获取String中数字的个数
 */
- (NSUInteger)countNumberOfWords;

/**
 * 判断String中是否含有subString
 * 比如"ABCD"中包含有"BC"字符串，但不包含有"AC"字符串
 */
- (BOOL)containsString:(NSString *)subString;

/**
 * 判断String中是否以string开头
 */
- (BOOL)isBeginsWith:(NSString *)string;

/**
 * 判断String中是否以string结尾
 */
- (BOOL)isEndssWith:(NSString *)string;

/**
 * 把String中的olderChar用newerChar替换
 */
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;

/**
 * 取出String中的从begin位置到end位置的字符串片段
 */
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;

/**
 * 在String结尾拼接上一个string
 */
- (NSString *)addString:(NSString *)string;

/**
 * 从String中删除掉string这个子字符串
 */
- (NSString *)removeSubString:(NSString *)subString;

/**
 * 判断String是否只含有字母
 */
- (BOOL)containsOnlyLetters;

/**
 * 判断String是否只含有数字
 */
- (BOOL)containsOnlyNumbers;

/**
 * 判断String是否只含有数字和字母
 */
- (BOOL)containsOnlyNumbersAndLetters;

/**
 * 判断字符串数组array中是存在String字符串
 */
- (BOOL)isInThisarray:(NSArray*)array;

/**
 * 将array数组转换为String字符串
 */
+ (NSString *)getStringFromArray:(NSArray *)array;

/**
 * 将String字符串转换为array数组
 */
- (NSArray *)getArray;

/**
 * 获取应用版本号
 */
+ (NSString *)getApplicationVersion;

/**
 * 获取应用名称
 */
+ (NSString *)getApplicationName;

/**
 * 将String转换为用UTF8编码的二进制数据
 */
- (NSData *)convertToData;

/**
 * 将UTF8编码的二进制数据还原为String
 */
+ (NSString *)getStringFromData:(NSData *)data;

/**
 * 判断是否为有效的邮箱
 */
- (BOOL)isValidEmail;

/**
 * 判断是否为有效的手机号码
 */
- (BOOL)isVAlidPhoneNumber;

/**
 * 判断是否为有效的url地址
 */
- (BOOL)isValidUrl;

/**
 * 获取单行文字的尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 * 获取多行文字的尺寸（附加了行间距和指定了范围）
 * 多用于计算label等文字控件的自适应高度
 */
- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize;

/**
 * 根据行间距和字体获取富文本（默认字体颜色为黑色）
 * @param lineSpacing 行间距
 */
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
/**
 * 根据行间距、字体、颜色获取富文本
 * @param lineSpacing 行间距
 * @param color 字体颜色
 */
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)color;

/**
 * 将数字时间转换成字符时间，并计算距离此时多久
 * @param timeInterval 时间戳（精确到毫秒）
 */
+ (NSString *)transTimeSpWithTimeInterval:(NSTimeInterval)timeInterval;

/**
 * 将Unicode编码的字符串转换为普通字符
 * 例如:将字符串"\u4f3c\u4e4e\u5df2\u65ad\u5f00\u4e0e\u4e92\u8054\u7f51\u7684\u8fde\u63a5"转换后就是"似乎已断开与互联网的连接"
 * 一般用于打印查看服务器返回的一些错误信息
 */
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

/**
 * 将String进行MD5加密
 */
- (NSString *)MD5String;

/**
 * 将String进行SHA1加密
 */
- (NSString *)SHA1String;

/**
 * 获取UUID字符串，每个UUID字符串在本应用中是唯一的
 * 得到的结果例如：36lPjxiCiIVhmIIVKwQ37Ez4
 * 可用于文件名等
 */
+ (NSString *)UUID;

@end
