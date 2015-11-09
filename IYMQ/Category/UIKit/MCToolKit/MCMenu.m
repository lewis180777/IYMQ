//
//  MCMenu.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "MCMenu.h"
@interface MCMenu()
@property (nonatomic) NSInteger nowViewIndex;
@property (nonatomic) BOOL isAnimating;

@property (nonatomic, strong) void (^completion)(BOOL finished);
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation MCMenu

- (void)mainView:(UIView *)mainView WithViewControllers:(NSArray *)viewContollers
{
    self.viewControllers = viewContollers;
    
    UIViewController *rootViewController = [[UIViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.navigationController = nav;
    self.navigationController.view.frame = SCREEN_FRAME;
    self.navigationController.navigationBarHidden = YES;
    
    UU_RELEASE(rootViewController);
    UU_RELEASE(nav);
    
    [mainView addSubview:self.navigationController.view];
    [mainView sendSubviewToBack:self.navigationController.view];
    
    self.nowViewIndex = -1;
    
    UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    UU_RELEASE(vc);
}

#pragma mark - 自定义push动画
- (BOOL)pushViewController:(NSInteger)index Completion:(void (^)(BOOL finished))completion
{
    return [self pushViewController:index WithData:nil Completion:completion];
}
//自定义push动画 传数据
- (BOOL)pushViewController:(NSInteger)index WithData:(id)data Completion:(void (^)(BOOL finished))completion
{
    if (self.nowViewIndex == index || self.isAnimating == YES) {
        return NO;
    }
    self.completion = completion;
    self.nowViewIndex = index;
    self.isAnimating = YES;
    
    //反射取出控制器
    NSString *classNmae = self.viewControllers[index];
    MCViewController *vc = [(MCViewController *)[NSClassFromString(classNmae) alloc] initWithData:data];
    
    self.nowViewController.changeImageString = vc.backgroundImageString;
    
    if (self.nowViewController != nil) {
        self.nowViewController.changeImageString = vc.backgroundImageString;
        
        [self.nowViewController viewDisappearAnimation:^(BOOL finished) {
            
            self.isAnimating = NO;
            self.nowViewController = vc;
            
            // 返回根再推
            [self.navigationController popToRootViewControllerAnimated:NO];
            [self.navigationController pushViewController:vc animated:NO];
            
            if (self.completion != nil) {
                self.completion(YES);
            }
        }];
    } else {
        self.isAnimating = NO;
        self.nowViewController = vc;
        [self.navigationController pushViewController:vc animated:NO];
        
        if (self.completion != nil) {
            self.completion(YES);
        }
    }
    UU_RELEASE(vc);
    return YES;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.isAnimating = NO;
    if (self.completion != nil) {
        self.completion(YES);
    }
}
- (void)dealloc {
    self.nowViewController = nil;
    self.completion = nil;
    self.viewControllers = nil;
    self.navigationController = nil;
    
    UU_DEALLOC;
}
@end
