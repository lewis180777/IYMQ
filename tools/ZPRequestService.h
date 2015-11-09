//
//  ZPRequestService.h
//  RequestTest
//
//  Created by 张平 on 15/10/15.
//  Copyright © 2015年 zhangping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPRequestService : UIView

@property (nonatomic, strong, readonly) UIView *borderView;

// 菊花显示
@property (nonatomic, strong, readonly) UIActivityIndicatorView *activityIndicator;

// The activity label
@property (nonatomic, strong, readonly) UILabel *activityLabel;

// 文本宽度
@property (nonatomic) NSUInteger labelWidth;

// 是否显示网络菊花
@property (nonatomic) BOOL showNetworkActivityIndicator;

//  返回当前
+ (ZPRequestService *)currentActivityView;

+ (ZPRequestService *)activityViewForView:(UIView *)addToView;

+ (ZPRequestService *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText;

+ (ZPRequestService *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;

//初始化
- (ZPRequestService *)initForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;

//移除
+ (void)removeView;

@end


@interface ZPRequestService ()

- (UIView *)viewForView:(UIView *)view;
- (CGRect)enclosingFrame;
- (void)setupBackground;
- (UIView *)makeBorderView;
- (UIActivityIndicatorView *)makeActivityIndicator;
- (UILabel *)makeActivityLabelWithText:(NSString *)labelText;
- (void)animateShow;
- (void)animateRemove;

@end


@interface ZPWhiteActivityView : ZPRequestService

@end


@interface ZPActivityView : ZPRequestService

+ (void)removeViewAnimated:(BOOL)animated;

@end


@interface ZPKeyboardActivityView : ZPRequestService

// Creates and adds a keyboard-style activity view, using the label "Loading...".  Returns the activity view, already covering the keyboard, or nil if the keyboard isn't currently displayed:
+ (ZPKeyboardActivityView *)activityView;

// Creates and adds a keyboard-style activity view, using the specified label.  Returns the activity view, already covering the keyboard, or nil if the keyboard isn't currently displayed:
+ (ZPKeyboardActivityView *)activityViewWithLabel:(NSString *)labelText;

@end


@interface UIApplication (KeyboardView)

- (UIView *)keyboardView;

@end;

