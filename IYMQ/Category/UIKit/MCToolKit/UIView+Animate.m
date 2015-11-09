//
//  UIView+Animate.m
//  yiheng
//
//  Created by WXH on 15/8/20.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "UIView+Animate.h"

@implementation UIView (Animate)
- (void)moveLeft:(CGFloat)distance WithDuration:(NSTimeInterval)duration{
    [self moveLeft:distance WithDuration:duration Delay:0];
}
- (void)moveRight:(CGFloat)distance WithDuration:(NSTimeInterval)duration{
    [self moveRight:distance WithDuration:duration Delay:0];
}

- (void)moveUp:(CGFloat)distance WithDuration:(NSTimeInterval)duration{
    [self moveUp:distance WithDuration:duration Delay:0];
}
- (void)moveDown:(CGFloat)distance WithDuration:(NSTimeInterval)duration{
    [self moveDown:distance WithDuration:duration Delay:0];
}

- (void)movePostion:(CGPoint)position WithDuration:(NSTimeInterval)duration{
    [self movePostion:position WithDuration:duration Delay:0];
}

#pragma mark -
- (void)moveLeft:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay {
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1;
                         
                         CGRect rect = self.frame;
                         rect.origin.x -= distance;
                         self.frame = rect;
                     } completion:nil];
}
- (void)moveRight:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay {
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1;
                         
                         CGRect rect = self.frame;
                         rect.origin.x += distance;
                         self.frame = rect;
                     } completion:nil];
}
- (void)moveUp:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay {
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1;
                         
                         CGRect rect = self.frame;
                         rect.origin.y -= distance;
                         self.frame = rect;
                     } completion:nil];
}
- (void)moveDown:(CGFloat)distance WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay {
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1;
                         
                         CGRect rect = self.frame;
                         rect.origin.y += distance;
                         self.frame = rect;
                     } completion:nil];
}
- (void)movePostion:(CGPoint)position WithDuration:(NSTimeInterval)duration Delay:(NSTimeInterval)delay {
    [UIView animateWithDuration:duration
                          delay:delay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 1;
                         
                         CGRect rect = self.frame;
                         rect.origin = position;
                         self.frame  = rect;
                     } completion:nil];
}

@end
