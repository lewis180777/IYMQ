//
//  CustomNavigationController.h
//  MCDM
//
//  Created by Fred on 12-12-27.
//  Copyright (c) 2012年 Fred. All rights reserved.
//

#pragma once

#import <UIKit/UIKit.h>
#import "UIViewController+UIViewController_category.h"
#import "NavigationInteractiveTransition.h"

@interface UINavigationBar (UINavigationBarCategory)

-(void)setBackgroundImage:(UIImage*)image;

@end

@interface CustomNavigationController : UINavigationController <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIPanGestureRecognizer *popRecognizer;
/**
 *  方案一不需要的变量
 */
@property (nonatomic, strong) NavigationInteractiveTransition *navT;

@property(nonatomic,retain) UIViewController *firstViewController; // The first view controller on the stack.
@end
