//
//  NSString+MCString.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "NSString+MCString.h"

@implementation NSString (MCString)
//URL编码
+(NSString*)urlEncode:(NSString *)str
{
    return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//URL解码
+(NSString*)urlDecode:(NSString*)str
{
    return [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//判断邮件格式是否正常
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"1\\d{10}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


//中英文混合字数统计
+ (int)wordCountToInt:(NSString*)strtemp
{
    int i,n = (int)[strtemp length],l=0,a=0,b=0;
    unichar c;
    for(i = 0;i < n;i ++){
        c = [strtemp characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}

//获取当前设备ip地址
+ (NSString *)getIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

//判断字符串是否为空
+ (BOOL)isEmptyString:(NSString *)string
{
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    } else {
        return NO;
    }
}

//指定宽度、字体，计算文本的高度
+ (CGFloat)contentCellHeightWithText:(NSString*)text WithWidth:(CGFloat)width WithFont:(UIFont *)font
{
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return size.height;
}

//指定高度、字体，计算文本的宽度
+ (CGFloat)contentCellWidthWithText:(NSString*)text WithHeight:(CGFloat)height WithFont:(UIFont *)font
{
    CGSize size = CGSizeMake(MAXFLOAT, height);
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return size.width;
}

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
+ (BOOL)contentOfPoint:(CGPoint)point WithPoint1:(CGPoint)point1 WithPoint2:(CGPoint)point2 WithPoint3:(CGPoint)point3
{
    CGMutablePathRef pathRef=CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, point1.x, point1.y);
    CGPathAddLineToPoint(pathRef, NULL, point2.x, point2.y);
    CGPathAddLineToPoint(pathRef, NULL, point3.x, point3.y);
    CGPathCloseSubpath(pathRef);
    
    if (CGPathContainsPoint(pathRef, NULL, point, NO))
    {
        return YES;
    } else {
        return NO;
    }
}
@end
