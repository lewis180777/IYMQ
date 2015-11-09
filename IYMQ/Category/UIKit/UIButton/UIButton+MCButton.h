//
//  UIButton+MCButton.h
//  fukai
//
//  Created by WXH on 15/6/23.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MCViewController.h"
//#import "UIView+Animate.h"

typedef void (^ActionComplete)(UIButton *sender);

@interface UIButton (MCButton)
@property (nonatomic, strong, readwrite) ActionComplete actionComplete;

#pragma mark - 不带高亮
+ (UIButton *)bundleButton:(NSString *)name;

+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view;
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position;
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha;

#pragma mark - 不带高亮,扩展block
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Action:(ActionComplete)actionComplete;
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Action:(ActionComplete)actionComplete;
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha Action:(ActionComplete)actionComplete;


#pragma mark - 带有高亮
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h;
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view;
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view Action:(ActionComplete)actionComplete;
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view Position:(CGPoint)position Action:(ActionComplete)actionComplete;

#pragma mark- 平移动画，自定义时间
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

#pragma mark- 平移动画，默认时间
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Action:(ActionComplete)actionComplete;

#pragma mark- 平移动画，默认时间，带延迟
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;


#pragma mark - 对象方法 -------
#pragma mark- 平移动画，自定义时间
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete;

#pragma mark- 平移动画，默认时间
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete;

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition Action:(ActionComplete)actionComplete;

#pragma mark- 平移动画，默认时间，带延迟
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete;
@end
