//
//  NSObject+Category.h
//  Category
//
//  Created by Apple on 15/4/21.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Category)

/**
 * 在主线程中运行某个方法，可带两个参数
 * @param aSelector 方法名（指针）
 * @param arg1 参数一
 * @param arg2 参数二
 * @param wait 是否等待执行完成
 */
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg1 withObject:(id)arg2 waitUntilDone:(BOOL)wait;

/**
 * 在后台（子）线程中运行某个方法，可带两个参数
 * @param aSelector 方法名（指针）
 * @param arg1 参数一
 * @param arg2 参数二
 */
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg1 withObject:(id)arg2;

@end
