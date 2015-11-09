//
//  UIColor+Category.m
//  Category
//
//  Created by Apple on 15/4/20.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

#pragma mark - Public Method

+ (UIColor *)randomColor {
    return [[self class] randomColorWithAlpha:1.0];
}

+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha {
    CGFloat red   = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue  = arc4random() % 256 / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [[self class] colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:rString] scanHexInt:&red];
    [[NSScanner scannerWithString:gString] scanHexInt:&green];
    [[NSScanner scannerWithString:bString] scanHexInt:&blue];
    
    return [[self class] colorWithR:(float)red G:(float)green B:(float)blue A:alpha];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue {
    return [[self class] colorWithR:red G:green B:blue A:1.0];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (UIColor *)gradientColorFromColor:(UIColor *)color1 toColor:(UIColor *)color2 value:(CGFloat)value {
    return [[self class] gradientColorFromColor:color1 toColor:color2 value:value orientation:GradientOrientationTopToBottom];
}

+ (UIColor *)randomGradientColorWithValue:(CGFloat)value {
    UIColor *color1 = [[self class] randomColor];
    UIColor *color2 = [[self class] randomColor];
    return [[self class] gradientColorFromColor:color1 toColor:color2 value:value orientation:GradientOrientationTopToBottom];
}

+ (UIColor *)randomGradientColorWithValue:(CGFloat)value orientation:(GradientOrientation)orientation {
    UIColor *color1 = [[self class] randomColor];
    UIColor *color2 = [[self class] randomColor];
    return [[self class] gradientColorFromColor:color1 toColor:color2 value:value orientation:orientation];
}

+ (UIColor *)gradientColorFromColor:(UIColor *)color1 toColor:(UIColor *)color2 value:(CGFloat)value orientation:(GradientOrientation)orientation {
    CGSize size = CGSizeZero;
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    
    if (orientation == GradientOrientationTopToBottom) {
        size = CGSizeMake(1.0, value);
        endPoint = CGPointMake(0, size.height);
    }
    else {
        size = CGSizeMake(value, 1.0);
        endPoint = CGPointMake(size.width, 0);
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray *colors = [NSArray arrayWithObjects:(id)color1.CGColor, (id)color2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
