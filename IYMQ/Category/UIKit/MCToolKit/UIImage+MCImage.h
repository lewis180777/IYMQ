//
//  UIImage+MCImage.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (MCImage)

//根据图片名字取Documents里的图片
+(UIImage *)documentsImage:(NSString *)name;

//根据图片名字取Documents里的图片并压缩成JPEG图片
+(UIImage *)scaleDocumentsImageToJPEG:(NSString *)name;
+(UIImage *)scaleDocumentsImageToJPEG:(NSString *)name WithScale:(CGFloat)scale;

//根据图片名字取Documents里的图片并压缩成PNG图片
+(UIImage *)scaleDocumentsImageToPNG:(NSString *)name;

//根据图片名字取Bundle里的图片
+(UIImage *)bundleImage:(NSString *)name;

//根据图片名字取Bundle里的图片并压缩成JPEG图片
+(UIImage *)scaleBundleImageToJPEG:(NSString *)name;
+(UIImage *)scaleBundleImageToJPEG:(NSString *)name WithScale:(CGFloat)scale;

//根据图片名字取Bundle里的图片并压缩成PNG图片
+(UIImage *)scaleBundleImageToPNG:(NSString *)name;

//压缩图片成PNG图片
+(UIImage *)scaleToPNGImage:(UIImage *)aimage;

//压缩图片成JPEG图片
+(UIImage *)scaleToJPEGImage:(UIImage *)aimage WithScale:(CGFloat)scale;

//压缩成指定大小代码,这个方法适用于 对压缩后的图片的质量要求不高或者没有要求,因为这种方法只是压缩了图片的大小
+(UIImage *)scaleImage:(UIImage *)img Tosize:(CGSize)size;

//将图片压缩到指定的大小
+(UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

//指定宽度，将图片等比压缩
+(UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

//指定高度，将图片等比压缩
+(UIImage *)imageCompressForHeight:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;

//传入的参数：1、生成图片的大小 2、压缩比 3、存放图片的路径
+(void)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent toPath:(NSString *)thumbPath;

/**
 *  图片添加模糊效果
 *
 *  @param image 要添加模糊效果的图片
 *  @param blur  模糊度，值：0 ~ 2
 *
 *  @return 返回一个已变模糊的图片
 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
