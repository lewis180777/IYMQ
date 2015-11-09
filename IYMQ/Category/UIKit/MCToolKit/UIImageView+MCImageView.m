//
//  UIImageView+MCImageView.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "UIImageView+MCImageView.h"

@implementation UIImageView (MCImageView)

#pragma mark - 创建bundle路径下的图片
+ (UIImageView *)bundleImageView:(NSString *)name
{
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:name];
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width/2, image.size.height/2)];
    imageView.image = image;
    
    UU_AUTORELEASE(imageView);
    return imageView;
}
+ (UIImageView *)bundleImageView:(NSString *)name Position:(CGPoint)position
{
    UIImageView *imageView = [UIImageView bundleImageView:name];
    CGRect rect = imageView.frame;
    rect.origin = position;
    imageView.frame = rect;
    return imageView;
}

+ (UIImageView *)bundleImageView:(NSString *)name Position:(CGPoint)position Alpha:(CGFloat)alpha
{
    UIImageView *imageView = [UIImageView bundleImageView:name Position:position];
    imageView.alpha = alpha;
    return imageView;
}

+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view{
    UIImageView *imageView = [UIImageView bundleImageView:name];
    [view addSubview:imageView];
    return imageView;
}
+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view Position:(CGPoint)position {
    UIImageView *imageView = [UIImageView bundleImageView:name In:view];
    CGRect rect = imageView.frame;
    rect.origin = position;
    imageView.frame = rect;
    return imageView;
}
+ (UIImageView *)bundleImageView:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha{
    UIImageView *imageView = [UIImageView bundleImageView:name In:view Position:position];
    imageView.alpha = alpha;
    return imageView;
}


#pragma mark - 平移动画，自定义时间
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveUp:distance WithDuration:duration];
    return imageView;
}

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveDown:distance WithDuration:duration];
    return imageView;
}

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveLeft:distance WithDuration:duration];
    return imageView;
}

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveRight:distance WithDuration:duration];
    return imageView;
}

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView movePostion:toPosition WithDuration:duration];
    return imageView;
}

//平移动画，默认0.4s
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance {
    UIImageView *imageView = [UIImageView moveUpInVC:viewController N:name P:position D:distance T:0.4];
    return imageView;
}

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance {
    UIImageView *imageView = [UIImageView moveDownInVC:viewController N:name P:position D:distance T:0.4];
    return imageView;
}

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance {
    UIImageView *imageView = [UIImageView moveLeftInVC:viewController N:name P:position D:distance T:0.4];
    return imageView;
}

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance {
    UIImageView *imageView = [UIImageView moveRightInVC:viewController N:name P:position D:distance T:0.4];
    return imageView;
}

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition {
    UIImageView *imageView = [UIImageView movePostiontInVC:viewController N:name P:position Tp:toPosition T:0.4];
    return imageView;
}

#pragma mark- 平移动画，默认时间，带延迟
+ (UIImageView *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveUp:distance WithDuration:0.4 Delay:delay];
    return imageView;
}

+ (UIImageView *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveDown:distance WithDuration:0.4 Delay:delay];
    return imageView;
}

+ (UIImageView *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveLeft:distance WithDuration:0.4 Delay:delay];
    return imageView;
}

+ (UIImageView *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView moveRight:distance WithDuration:0.4 Delay:delay];
    return imageView;
}

+ (UIImageView *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay {
    UIImageView *imageView = [UIImageView bundleImageView:name In:viewController.view Position:position Alpha:0];
    [viewController backupView:imageView];
    
    [imageView movePostion:toPosition WithDuration:0.4 Delay:delay];
    return imageView;
}
@end
