//
//  MainTabBarController.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/2.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"

@interface MainTabBarController : UITabBarController

/**
 *  初始化tabbar
 *
 *  @return MainTabBarController
 */
+ (instancetype)sharedInstance;

/**
 *  创建一个UITabBarItem
 *
 *  @param title <#title description#>
 *  @param Image <#Image description#>
 *
 *  @return UITabBarItem
 */
- (UITabBarItem *)initwithTitle:(NSString *)title withImage:(NSString *)Image;

/**
 *  创建一个导航栏
 *
 *  @param viewControll <#viewControll description#>
 *
 *  @return <#return value description#>
 */
- (CustomNavigationController *)initwithRootview:(UIViewController *)viewControll;

- (void)setAppRootTabBarcontrollers:(NSInteger )integer;
- (void)setRootselectedIndex:(NSInteger )integer;


@end
