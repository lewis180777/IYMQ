//
//  UIButton+Block.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);
typedef void (^ActionComplete)(UIButton *sender);


@interface UIButton (Block)

@property (nonatomic, strong, readwrite) ActionComplete actionComplete;

-(void)addActionHandler:(TouchedBlock)touchHandler;

#pragma mark -按钮只有文字
+ (UIButton *)bundleWithTitle:(NSString *)title BGColor:(UIColor *)color titleColor:(UIColor *)textColor textHighligtedColor:(UIColor *)highColor;

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

@end
