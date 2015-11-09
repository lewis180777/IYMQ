//
//  UIButton+MCButton.m
//  fukai
//
//  Created by WXH on 15/6/23.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "UIButton+MCButton.h"
#import <objc/runtime.h>

static void * MyObjectMyCustomPorpertyKey = (void *)@"MyObjectMyCustomPorpertyKey";
@implementation UIButton (MCButton)

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

#pragma mark- 平移动画，自定义时间
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveUp:distance WithDuration:duration];
    return button;
}

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];    [viewController backupView:button];
    
    [button moveDown:distance WithDuration:duration];
    return button;
}

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveLeft:distance WithDuration:duration];
    return button;
}

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveRight:distance WithDuration:duration];
    return button;
}

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button movePostion:toPosition WithDuration:duration];
    return button;
}

#pragma mark- 平移动画，默认时间
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete{
    return [UIButton moveUpInVC:viewController N:name P:position D:distance T:0.4 Action:actionComplete];
}

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete{
    return [UIButton moveDownInVC:viewController N:name P:position D:distance T:0.4 Action:actionComplete];
}

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete{
    return [UIButton moveLeftInVC:viewController N:name P:position D:distance T:0.4 Action:actionComplete];
}

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton moveRightInVC:viewController N:name P:position D:distance T:0.4 Action:actionComplete];

    return button;
}

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Action:(ActionComplete)actionComplete{
    return [UIButton movePostiontInVC:viewController N:name P:position Tp:toPosition T:0.4 Action:actionComplete];
}

#pragma mark- 平移动画，默认时间，带延迟
+ (UIButton *)moveUpInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveUp:distance WithDuration:0.4 Delay:delay];
    return button;
}

+ (UIButton *)moveDownInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveDown:distance WithDuration:0.4 Delay:delay];
    return button;
}

+ (UIButton *)moveLeftInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveLeft:distance WithDuration:0.4 Delay:delay];
    return button;
}

+ (UIButton *)moveRightInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button moveRight:distance WithDuration:0.4 Delay:delay];
    return button;
}

+ (UIButton *)movePostiontInVC:(MCViewController *)viewController N:(NSString *)name P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete{
    UIButton *button = [UIButton bundleButton:name In:viewController.view Position:position Alpha:0 Action:actionComplete];
    [viewController backupView:button];
    
    [button movePostion:toPosition WithDuration:0.4 Delay:delay];
    return button;
}
+ (void)buttonAction:(UIButton *)sender {
    __block UIButton *button = sender;
    if (sender.actionComplete != nil) {
        sender.actionComplete(button);
    }
}



#pragma mark - 对象方法 -------
#pragma mark- 平移动画，自定义时间
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveUp:distance WithDuration:duration];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveDown:distance WithDuration:duration];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveLeft:distance WithDuration:duration];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveRight:distance WithDuration:duration];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition T:(NSTimeInterval)duration Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self movePostion:toPosition WithDuration:duration];
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark- 平移动画，默认时间
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete {
    [self moveUpInVC:viewController P:position D:distance T:0.4 Action:actionComplete];
}

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete {
    [self moveDownInVC:viewController P:position D:distance T:0.4 Action:actionComplete];
}
- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete {
    [self moveLeftInVC:viewController P:position D:distance T:0.4 Action:actionComplete];
}

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Action:(ActionComplete)actionComplete {
    [self moveRightInVC:viewController P:position D:distance T:0.4 Action:actionComplete];
}

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition Action:(ActionComplete)actionComplete {
    [self movePostiontInVC:viewController P:position Tp:toPosition T:0.4 Action:actionComplete];
}

#pragma mark- 平移动画，默认时间，带延迟
- (void)moveUpInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveUp:distance WithDuration:0.4 Delay:delay];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveDownInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveDown:distance WithDuration:0.4 Delay:delay];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveLeftInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveLeft:distance WithDuration:0.4 Delay:delay];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)moveRightInVC:(MCViewController *)viewController P:(CGPoint)position D:(CGFloat)distance Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self moveRight:distance WithDuration:0.4 Delay:delay];
    
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)movePostiontInVC:(MCViewController *)viewController P:(CGPoint)position Tp:(CGPoint)toPosition Delay:(NSTimeInterval)delay Action:(ActionComplete)actionComplete {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
    
    self.alpha = 0;
    self.actionComplete = actionComplete;
    [viewController.view addSubview:self];
    [viewController backupView:self];
    [self movePostion:toPosition WithDuration:0.4 Delay:delay];
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)sender {
    __block UIButton *button = sender;
    if (sender.actionComplete != nil) {
        sender.actionComplete(button);
    }
}
@end
