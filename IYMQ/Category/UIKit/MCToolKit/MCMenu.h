//
//  MCMenu.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCViewController.h"

@interface MCMenu : NSObject
@property (nonatomic, strong)MCViewController *nowViewController;

- (void)mainView:(UIView *)mainView WithViewControllers:(NSArray *)viewContollers;

//自定义push动画
- (BOOL)pushViewController:(NSInteger)index Completion:(void (^)(BOOL finished))completion;

//自定义push动画 传数据
- (BOOL)pushViewController:(NSInteger)index WithData:(id)data Completion:(void (^)(BOOL finished))completion;
@end
