//
//  NSData+MCDate.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MCDate)
//时间转换成字符串 格式：2014-06-27 00：00：00 -》2014-6-27
+ (NSString *)dateForString:(NSDate *)date;

//时间转换成字符串(含小时、分、秒) 格式：2014-06-27 00：00：00 -》2014-06-27 00：00：00
+ (NSString *)dateAndTimeForString:(NSDate *)date;

//字符串转换成时间 格式：2014-6-27 -》2014-06-27 00：00：00
+ (NSDate *)stringForDate:(NSString *)string;

//字符串转换成时间含小时、分、秒 格式：2014-6-27 00：00：00 -》2014-06-27 00：00：00
+ (NSDate *)stringForDateAndTime:(NSString *)string;


//字符串时间转换成，1970到现在的秒数  格式：2014-6-27
+ (NSTimeInterval)secondSince1970WithDateString:(NSString *)string;

//字符串时间(含小时、分、秒)转换成，1970到现在的秒数  格式：2014-06-27 00：00：00
+ (NSTimeInterval)secondSince1970WithDateAndTimeString:(NSString *)string;

//1970到现在的秒数
+ (NSTimeInterval)nowSecondSince1970;
@end
