//
//  CoreAnimationEffect.h
//  WoEGo
//
//  Created by 陈亦海 on 15/4/27.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 !  导入QuartzCore.framework
 *
 *  Example:
 *
 *  Step.1
 *
 *      #import "CoreAnimationEffect.h"
 *
 *  Step.2
 *
 *      [CoreAnimationEffect animationMoveLeft:your view];
 *
 */


@interface CoreAnimationEffect : NSObject

#pragma mark - Custom Animation

/**
 *   @brief 快速构建一个你自定义的动画,有以下参数供你设置.
 *
 *   @note  调用系统预置Type需要在调用类引入下句
 *
 *          #import <QuartzCore/QuartzCore.h>
 *
 *   @param type                动画过渡类型
 *   @param subType             动画过渡方向(子类型)
 *   @param duration            动画持续时间
 *   @param timingFunction      动画定时函数属性
 *   @param theView             需要添加动画的view.
 *
 *
 */

+ (void)showAnimationType:(NSString *)type
              withSubType:(NSString *)subType
                 duration:(CFTimeInterval)duration
           timingFunction:(NSString *)timingFunction
                     view:(UIView *)theView;

#pragma mark - Preset Animation

/**
 *  下面是一些常用的动画效果
 */

// reveal
+ (void)animationRevealFromBottom:(UIView *)view;
+ (void)animationRevealFromTop:(UIView *)view;
+ (void)animationRevealFromLeft:(UIView *)view;
+ (void)animationRevealFromRight:(UIView *)view;

// 渐隐渐消
+ (void)animationEaseIn:(UIView *)view;
+ (void)animationEaseOut:(UIView *)view;

// 翻转
+ (void)animationFlipFromLeft:(UIView *)view;
+ (void)animationFlipFromRigh:(UIView *)view;

// 翻页
+ (void)animationCurlUp:(UIView *)view;
+ (void)animationCurlDown:(UIView *)view;

// push
+ (void)animationPushUp:(UIView *)view;
+ (void)animationPushDown:(UIView *)view;
+ (void)animationPushLeft:(UIView *)view;
+ (void)animationPushRight:(UIView *)view;

// move
+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIView *)view;
+ (void)animationMoveRight:(UIView *)view;

// 旋转缩放

// 各种旋转缩放效果
+ (void)animationRotateAndScaleEffects:(UIView *)view;

// 旋转同时缩小放大效果
+ (void)animationRotateAndScaleDownUp:(UIView *)view;



#pragma mark - Private API

/**
 *  下面动画里用到的某些属性在当前API里是不合法的,但是也可以用.
 */

//旋转
+ (void)animationFlipFromTop:(UIView *)view;
+ (void)animationFlipFromBottom:(UIView *)view;

+ (void)animationCubeFromLeft:(UIView *)view;
+ (void)animationCubeFromRight:(UIView *)view;
+ (void)animationCubeFromTop:(UIView *)view;
+ (void)animationCubeFromBottom:(UIView *)view;

+ (void)animationSuckEffect:(UIView *)view;

+ (void)animationRippleEffect:(UIView *)view;

//打开关闭
+ (void)animationCameraOpen:(UIView *)view;
+ (void)animationCameraClose:(UIView *)view;

+ (void)zoomIn: (UIView *)view andAnimationDuration: (float) duration;
//小变大动画
+ (void)showXuanZhuangOnView:(UIView *)ui_View;
//旋转动画


+(void)opacityForever_Animation:(float)time onView:(UIView *)ui_View;
//／／永久闪烁的动画
+(void)opacityTimes_Animation:(float)repeatTimes
                     durTimes:(float)time onView:(UIView *)ui_View;
//／／有闪烁次数的动画
+(void)moveX:(float)time
           X:(NSNumber *)x onView:(UIView *)ui_View;
//／／横向移动
+(void)moveY:(float)time
           Y:(NSNumber *)y onView:(UIView *)ui_View;
//／／纵向移动
+(void)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time
         Rep:(float)repeatTimes onView:(UIView *)ui_View;
//／／缩放
+(void)groupAnimation:(NSArray *)animationAry durTimes:(float)time
                  Rep:(float)repeatTimes onView:(UIView *)ui_View;
//／／组合动画
+(void)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time
                     Rep:(float)repeatTimes onView:(UIView *)ui_View;
//／／路径动画
+(void)movepoint:(CGPoint )point onView:(UIView *)ui_View;
//／／点移动
+(void)rotation:(float)dur
         degree:(float)degree
      direction:(int)direction
    repeatCount:(int)repeatCount onView:(UIView *)ui_View;
//／／旋转
@end
