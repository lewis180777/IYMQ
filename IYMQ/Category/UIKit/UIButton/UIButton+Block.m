//
//  UIButton+Block.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;
static void * MyObjectMyCustomPorpertyKey = (void *)@"MyObjectMyCustomPorpertyKey";

@implementation UIButton (Block)

-(void)addActionHandler:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}


- (ActionComplete)actionComplete
{
    return objc_getAssociatedObject(self, MyObjectMyCustomPorpertyKey);
}

- (void)setActionComplete:(ActionComplete)actionComplete
{
    objc_setAssociatedObject(self, MyObjectMyCustomPorpertyKey, actionComplete, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (UIButton *)bundleButton:(NSString *)name{
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:name];
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view{
    UIButton *button = [UIButton bundleButton:name];
    [view addSubview:button];
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position{
    UIButton *button = [UIButton bundleButton:name In:view];
    CGRect rect = button.frame;
    rect.origin = position;
    button.frame = rect;
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha{
    UIButton *button = [UIButton bundleButton:name In:view Position:position];
    button.alpha = alpha;
    return button;
}

+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:view];
    button.actionComplete = actionComplete;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:view Action:actionComplete];
    CGRect rect = button.frame;
    rect.origin = position;
    button.frame = rect;
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name In:(UIView *)view Position:(CGPoint)position Alpha:(CGFloat)alpha Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:view Position:position Action:actionComplete];
    button.alpha = alpha;
    return button;
}

#pragma mark - 带有高亮
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h {
    UIButton *button = [UIButton bundleButton:name];
    
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:name_h];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [button setBackgroundImage:image forState:UIControlStateHighlighted];
    [button setBackgroundImage:image forState:UIControlStateSelected];
    
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view {
    UIButton *button = [UIButton bundleButton:name Highlight:name_h];
    [view addSubview:button];
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view Action:(ActionComplete)actionComplete {
    UIButton *button = [UIButton bundleButton:name Highlight:name_h In:view];
    button.actionComplete = actionComplete;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)bundleButton:(NSString *)name Highlight:(NSString *)name_h In:(UIView *)view Position:(CGPoint)position Action:(ActionComplete)actionComplete {
    UIButton *button = [UIButton bundleButton:name Highlight:name_h In:view Action:actionComplete];
    CGRect rect = button.frame;
    rect.origin = position;
    button.frame = rect;
    return button;
}

+ (void)buttonAction:(UIButton *)sender {
    __block UIButton *button = sender;
    if (sender.actionComplete != nil) {
        sender.actionComplete(button);
    }
}

@end

