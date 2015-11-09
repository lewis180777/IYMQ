//
//  NSData+MCDate.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//
//  NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:0];

#import "NSData+MCDate.h"

@implementation NSData (MCDate)
//时间转换成字符串 格式：2014-06-27 00：00：00 -》2014-6-27
+ (NSString *)dateForString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    UU_AUTORELEASE(formatter);
    return [formatter stringFromDate:date];
}

//时间转换成字符串 格式：2014-06-27 00：00：00 -》2014-6-27
+ (NSString *)dateAndTimeForString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    UU_AUTORELEASE(formatter);
    return [formatter stringFromDate:date];
}

//字符串转换成时间 格式：2014-6-27 -》2014-06-27 00：00：00
+ (NSDate *)stringForDate:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    UU_AUTORELEASE(formatter);
    return [formatter dateFromString:string];
}
//字符串转换成时间含小时、分、秒 格式：2014-6-27 00：00：00 -》2014-06-27 00：00：00
+ (NSDate *)stringForDateAndTime:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    UU_AUTORELEASE(formatter);
    return [formatter dateFromString:string];
}

//字符串时间转换成，1970到现在的秒数  格式：2014-6-27
+ (NSTimeInterval)secondSince1970WithDateString:(NSString *)string
{
    NSTimeInterval second;
    @autoreleasepool {
        NSDate *date = [self stringForDate:string];
        second = [date timeIntervalSince1970];
    }
    return second;
}

//字符串时间(含小时、分、秒)转换成，1970到现在的秒数  格式：2014-06-27 00：00：00
+ (NSTimeInterval)secondSince1970WithDateAndTimeString:(NSString *)string
{
    NSTimeInterval second;
    @autoreleasepool {
        NSDate *date = [self stringForDateAndTime:string];
        second = [date timeIntervalSince1970];
    }
    return second;
}

//1970到现在的秒数
+ (NSTimeInterval)nowSecondSince1970
{
    NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:0];
    return [nowDate timeIntervalSince1970];
}
@end
