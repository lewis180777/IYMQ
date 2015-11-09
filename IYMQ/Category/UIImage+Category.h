//
//  UIImage+Category.h
//  Category
//
//  Created by Apple on 15/4/20.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * 此Category为对图片的一些处理
 * 图片处理多为消耗系统资源的操作
 * 建议对图片处理莫放置在主线程中运行
 * 开启一线程处理图片，处理完成后在主线程中更新界面
 */

@interface UIImage (Category)

/**
 * 根据一颜色获取到图片
 * 亦可说为将颜色转换成图片
 */
+ (UIImage *)imageFromUIColor:(UIColor *)color;

/**
 * 获取屏幕截图
 */
+ (UIImage *)screenshot;

#pragma mark - Image Scale

/**
 * 将图片缩小到某个尺寸，不保持宽高比
 * @param dstSize 目标尺寸
 */
- (UIImage *)scaleToSize:(CGSize)dstSize;

/**
 * 将图片缩放到某个尺寸，不保持宽高比
 * 当图片尺寸不适合目标尺寸时，将从原图中间位置向四周取目标尺寸的图片内容
 * @param dstSize 目标尺寸
 */
- (UIImage *)scaleFitCenterToSize:(CGSize)dstSize;

/**
 * 将图片等比缩放到某个尺寸
 * @param dstSize 目标尺寸
 * @param scale 图片不够尺寸大时是否放大
 */
- (UIImage *)scaleToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;

/**
 * 从图片上的某个范围截取图片
 * @param bounds 截取范围
 */
- (UIImage *)croppedImageWithBounds:(CGRect)bounds;

#pragma mark - Image Round

/**
 * 将图片裁剪成为圆形
 * @param size 目标图片尺寸
 */
- (UIImage *)circleImageBaseSize:(CGSize)size;

/**
 * 将图片裁剪成为圆角
 * @param size 目标图片尺寸
 * @param radius 圆角度
 */
- (UIImage *)roundImageBaseSize:(CGSize)size withRadius:(CGFloat)radius;

#pragma mark - Image Effects

/**
 * 将图片加上模糊效果
 * 模糊度在0 - 1之间
 * @param blurRadius 模糊度
 */
- (UIImage *)blurImageWithBlurRadius:(CGFloat)blurRadius;

@end
