//
//  UIView+Category.h
//  Category
//
//  Created by Apple on 15/4/21.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITableView (Category)

/**
 * 用于隐藏没有数据的Cell
 */
- (void)setExtraCellLineHidden;

/**
 * 调整分隔线15像素的偏移
 */
- (void)setInsetMarginsZero;

@end

@interface UIView (Category)

/**
 * 获取view的x坐标
 */
@property (assign, nonatomic) CGFloat x;

/**
 * 获取view的y坐标
 */
@property (assign, nonatomic) CGFloat y;

/**
 * 获取view的宽度
 */
@property (assign, nonatomic) CGFloat width;

/**
 * 获取view的高度
 */
@property (assign, nonatomic) CGFloat height;

/**
 * 获取view的尺寸
 */
@property (assign, nonatomic) CGSize size;

/**
 * 获取view的坐标
 */
@property (assign, nonatomic) CGPoint origin;

/**
 * 使view变成圆角样式
 * @param aRadius 圆角值
 */
- (void)changeToRoundWithRadius:(CGFloat)aRadius;

/**
 * 给view加上边框，可设定边框宽度和颜色
 * @param aBorder 边框宽度
 * @param aColor  边框颜色
 */
- (void)changeBorder:(CGFloat)aBorder withColor:(UIColor *)aColor;

@end
