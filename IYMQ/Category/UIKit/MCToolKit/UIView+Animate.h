//
//  UIView+Animate.h
//  yiheng
//
//  Created by WXH on 15/8/20.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animate)
- (void)moveLeft:(CGFloat)distance WithDuration:(NSTimeInterval)duration;
- (void)moveRight:(CGFloat)distance WithDuration:(NSTimeInterval)duration;
- (void)moveUp:(CGFloat)distance WithDuration:(NSTimeInterval)duration;
- (void)moveDown:(CGFloat)distance WithDuration:(NSTimeInterval)duration;
- (void)movePostion:(CGPoint)position WithDuration:(NSTimeInterval)duration;

- (void)moveLeft:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay;
- (void)moveRight:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay;
- (void)moveUp:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay;
- (void)moveDown:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay;
- (void)movePostion:(CGPoint)position WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay;
@end
