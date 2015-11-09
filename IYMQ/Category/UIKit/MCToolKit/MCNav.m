//
//  MCNav.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "MCNav.h"

@interface MCNav()

@property (nonatomic) NSInteger nowViewIndex;
@property (nonatomic) BOOL isAnimating;

@property (nonatomic, strong) void (^completion)(BOOL finished);
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation MCNav
SYNTHESIZE_SINGLETON_FOR_CLASS(MCNav)


static MCNav *Nav = nil;

+ (void)mainView:(UIView *)mainView WithViewControllers:(NSArray *)viewContollers
{
    Nav = [MCNav sharedMCNav];
    Nav.viewControllers = viewContollers;
    
    UIViewController *rootViewController = [[UIViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    Nav.navigationController = nav;
    Nav.navigationController.view.frame = SCREEN_FRAME;
    Nav.navigationController.navigationBarHidden = YES;
    
    UU_RELEASE(rootViewController);
    UU_RELEASE(nav);
    
    [mainView addSubview:Nav.navigationController.view];
    [mainView sendSubviewToBack:Nav.navigationController.view];
    
    Nav.nowViewIndex = -1;
    
    MCViewController *vc = [[MCViewController alloc] init];
    Nav.nowViewController = vc;
    UU_RELEASE(vc);
    [Nav.navigationController pushViewController:Nav.nowViewController animated:NO];
}

#pragma mark - 自定义push动画
+ (BOOL)pushViewController:(NSInteger)index Completion:(void (^)(BOOL finished))completion
{
    return [self pushViewController:index WithData:nil Completion:completion];
}

//自定义push动画 传数据
+ (BOOL)pushViewController:(NSInteger)index WithData:(id)data Completion:(void (^)(BOOL finished))completion
{
    if (Nav.nowViewIndex == index || Nav.isAnimating == YES) {
        return NO;
    }
    Nav.completion = completion;
    Nav.nowViewIndex = index;
    Nav.isAnimating = YES;
    
    //反射取出控制器
    NSString *classNmae = Nav.viewControllers[index];
    MCViewController *vc = [(MCViewController *)[NSClassFromString(classNmae) alloc] initWithData:data];
    
    Nav.nowViewController.changeImageString = vc.backgroundImageString;
    
    if (Nav.nowViewController != nil) {
        [Nav.nowViewController viewDisappearAnimation:^(BOOL finished) {
            
            Nav.isAnimating = NO;
            Nav.nowViewController = vc;
            
            // 返回根再推
            [Nav.navigationController popToRootViewControllerAnimated:NO];
            [Nav.navigationController pushViewController:vc animated:NO];
            
            if (Nav.completion != nil) {
                Nav.completion(YES);
            }
        }];
    } else {
        Nav.isAnimating = NO;
        Nav.nowViewController = vc;
        [Nav.navigationController pushViewController:vc animated:NO];
        
        if (Nav.completion != nil) {
            Nav.completion(YES);
        }
    }
    UU_RELEASE(vc);
    
    return YES;
}

+ (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    Nav.isAnimating = NO;
    if (Nav.completion != nil) {
        Nav.completion(YES);
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
