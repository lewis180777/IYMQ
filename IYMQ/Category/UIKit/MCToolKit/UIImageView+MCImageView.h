//
//  UIImageView+MCImageView.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCViewController.h"
#import "UIView+Animate.h"

@interface UIImageView (MCImageView)

+ (UIImageView *)bundleImageView:(NSString *)name;
+ (UIImageView *)bundleImageView:(NSString *)name Position:(CGPoint)position;
+ (UIImageView *)bundleImageView:(NSString *)name Position:(CGPoint)position Alpha:(CGFloat)alpha;

+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view;
+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view Position:(CGPoint)position;
+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha;

#pragma mark- 平移动画，自定义时间
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration;

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration;

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration;

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration;

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration;

#pragma mark- 平移动画，默认时间
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance;

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance;

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance;

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance;

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition;

#pragma mark- 平移动画，默认时间，带延迟
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay;

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay;

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay;

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay;

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay;

@end
