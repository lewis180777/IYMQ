//
//  CustomNavigationController.m
//  MCDM
//
//  Created by Fred on 12-12-27.
//  Copyright (c) 2012年 Fred. All rights reserved.
//

#import "CustomNavigationController.h"

#import <QuartzCore/QuartzCore.h>


@implementation UINavigationBar (UINavigationBarCategory)
-(void)setBackgroundImage:(UIImage*)image
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue ] >= 5.0) {
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
    }
    else
    {
        self.layer.contents = (id)image.CGImage;
    }
}

/*-(UINavigationBar*)setBackgroundImage:(UIImage *)image forBarMetrics:(UIBarMetrics)barMetrics
{
    UINavigationBar * NavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    if(image == nil) return NavBar;
    UIImageView * bg = [[UIImageView alloc] initWithImage:image];
    bg.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
    [NavBar addSubview:bg];
    [NavBar sendSubviewToBack:bg];
    [self addSubview:bg];
    [self sendSubviewToBack:bg];
	return NavBar;
}

-(UINavigationBar*)setBackgroundImage:(UIImage*)image
{
	UINavigationBar * NavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    if(image == nil) return NavBar;
    UIImageView * bg = [[UIImageView alloc] initWithImage:image];
    bg.frame = CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height);
    [NavBar addSubview:bg];
    [NavBar sendSubviewToBack:bg];
	return NavBar;
}*/

- (void)didMoveToSuperview
{
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
//        backgroundImage = [UIImage imageNamed:@"top.png"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:20],
                           NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#FFFFFF"],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//        backgroundImage = [UIImage imageNamed:@"top.png"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont systemFontOfSize:20],
                           UITextAttributeTextColor: [UIColor colorWithHexString:@"#FFFFFF"],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [self setBackgroundImage:backgroundImage
                             forBarMetrics:UIBarMetricsDefault];
    [self setTitleTextAttributes:textAttributes];
    
//    self.backgroundColor = [UIColor colorWithHexString:@"#D14946"];
    
    self.translucent = YES;

    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor colorWithHexString:@"#D14946"]];
    
    
    
    
//     [self setBackgroundImage:[UIImage imageNamed:@"Nav.png"] forBarMetrics:UIBarMetricsDefault];
    
//    临时修改
//    [self setBackgroundImage:[UIImage imageNamed:@"nav_back.png"] forBarMetrics:UIBarMetricsDefault];
//    [self setTintColor:[UIColor whiteColor]];
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17.0], NSFontAttributeName, nil];
//    [self setTitleTextAttributes:attributes];
    
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    if(IOS_VERSION < 7.0){
//        [self setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"topBG.png"]]];
//        //        self.transoplucent = YES;
//    }
//    else{
//        [self setBackgroundImage:[UIImage imageNamed:@"topBG.png"] forBarMetrics:UIBarMetricsDefault];
//        //        self.translucent = YES;
//    }
//    
//    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:1 alpha:1], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:20], NSFontAttributeName, nil]];

    
    
    
//    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    {
//        BaseController2 * VCtrllr = (BaseController2*)[[self delegate] topViewController];
//        if ((nil == VCtrllr) || (([VCtrllr respondsToSelector:@selector(imgBack)]) && (nil == VCtrllr.imgBackground))) {
//            [self setBackgroundImage:[UIImage imageNamed:@"main_title.png"] forBarMetrics:UIBarMetricsDefault];
//        }
//    }
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
}

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];
    
    /*BCTabBarController *controller = (BCTabBarController *)UIUtil::Delegate().window.rootViewController;
    int selectIndex = controller.selectedIndex;
    if (selectIndex != 1)
    {
        self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.f].CGColor;
        self.layer.shadowOpacity = 0.9f;
        self.layer.shadowOffset = CGSizeMake(0, 0.4);
        CGRect shadowPath = CGRectMake(self.layer.bounds.origin.x - 10, self.layer.bounds.size.height - 6, self.layer.bounds.size.width + 20, 5);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowPath].CGPath;
        self.layer.shouldRasterize = YES;
    }
    else
    {
        self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.f].CGColor;
    }*/
}

- (void)drawRect:(CGRect)rect
{
    //[[UIImage imageNamed:@"main_title.png"] drawInRect:rect];
}

@end

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController
@synthesize firstViewController;

/*
- (void)setTitle:(NSString *)title
{
	UITabBarItem *barItem = [self.tabBarItem retain];
	self.tabBarItem = nil;
	[super setTitle:title];
	self.tabBarItem = barItem;
	[barItem release];
}*/


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.interactivePopGestureRecognizer.enabled = NO;
    __weak typeof (self) weakSelf = self;
    self.delegate = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
//    [UIApplication sharedApplication].statusBarHidden=NO;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//     self.navigationBar.translucent = YES;
//    UIImage *backgroundImage = nil;
//    NSDictionary *textAttributes = nil;
//    
//    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
//        backgroundImage = [UIImage imageNamed:@"top.png"];
//        
//        textAttributes = @{
//                           NSFontAttributeName: [UIFont systemFontOfSize:20],
//                           NSForegroundColorAttributeName: [UIColor redColor],
//                           };
//    } else {
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//        backgroundImage = [UIImage imageNamed:@"top.png"];
//        
//        textAttributes = @{
//                           UITextAttributeFont: [UIFont systemFontOfSize:20],
//                           UITextAttributeTextColor: [ComponentsFactory createColorByHex:TITLE_TEXT_COLOR],
//                           UITextAttributeTextShadowColor: [UIColor clearColor],
//                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
//                           };
//#endif
//    }
//    
//    [self.navigationBar setBackgroundImage:backgroundImage
//                             forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setTitleTextAttributes:textAttributes];
//    self.navigationBar.backgroundColor = [UIColor colorWithHexString:@"#D14946"];
    
    return;

//************    以下是自定义手势
//    
//    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
//    gesture.enabled = NO;
//    UIView *gestureView = gesture.view;
//    
//    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] init];
//    popRecognizer.delegate = self;
//    popRecognizer.maximumNumberOfTouches = 1;
//    [gestureView addGestureRecognizer:popRecognizer];
//    
////#if USE_方案一
////    _navT = [[NavigationInteractiveTransition alloc] initWithViewController:self];
////    [popRecognizer addTarget:_navT action:@selector(handleControllerPop:)];
////
////#elif USE_方案二
//    /**
//     *  获取系统手势的target数组
//     */
//    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
//    /**
//     *  获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
//     */
//    id gestureRecognizerTarget = [_targets firstObject];
//    /**
//     *  获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
//     */
//    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
//    /**
//     *  通过前面的打印，我们从控制台获取出来它的方法签名。
//     */
//    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
//    /**
//     *  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
//     */
//    [popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
    
//#endif
    
}
//************    以下是自定义手势
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    /**
//     *  这里有两个条件不允许手势执行，1、当前控制器为根控制器；2、如果这个push、pop动画正在执行（私有属性）
//     */
//    CGPoint vTranslationPoint = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self.view];
//     CGFloat progress = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self.view].x / gestureRecognizer.view.bounds.size.width;
//    if (fabs(vTranslationPoint.x) > fabs(vTranslationPoint.y)) {
//        //左右
//        NSLog(@"左右---%f",progress);
//        
//        if (vTranslationPoint.x > 0) {
//            NSLog(@"向右滑动");
//            return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
//        }
//        else {
//            NSLog(@"向左滑动");
//             return NO;
//        }
//        
//        
//    }else{
//        //上下
//        NSLog(@"上下");
//        return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
//        
//    }
////    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
//    
//}
//************    以上是自定义手势

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
	self = [super initWithRootViewController:rootViewController];
	if (self)
	{
		self.delegate = self;
	}
	return self;
}

-(BOOL)IsLandscape:(UIInterfaceOrientation )orientation
{
    return (orientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationLandscapeRight);
}

-(UIInterfaceOrientation)interfaceOrientation
{
   
    if ((YES != [[UIApplication sharedApplication] respondsToSelector:@selector(statusBarOrientation)])) {
        return [super interfaceOrientation];
    }
    else
    {
        return UIInterfaceOrientationPortrait;
    }
    //return self.topViewController.interfaceOrientation; //iOS 5.1 loop forever
}

/*-(void)interfaceOrientation
{
    if (YES != UIUtil::IsLandscape(UIUtil::Application().statusBarOrientation)) {
        [super interfaceOrientation];
    }
}*/

/*- (BOOL)shouldAutorotate {
    return NO;
	return [self.topViewController shouldAutorotate];
}*/

-(NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    UIViewController * VCtrllr = (UIViewController*)[super popViewControllerAnimated:animated];
//    if ([VCtrllr isKindOfClass:UIViewController.class] && (nil == VCtrllr.view.backgroundColor)) {
//        UIImage * imgBack = VCtrllr.view.backgroundColor;
//        [self.navigationBar setBackgroundImage:imgBack forBarMetrics:UIBarMetricsDefault];
//    }
//	return VCtrllr;
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	//_containerView.frame = [[UIScreen mainScreen] applicationFrame];
	//[UIUtil::Delegate().controller.rootController2 setTabBarHidden:YES animated:NO];
	
   
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
	if (self.viewControllers && [self.viewControllers count])
	{
         viewController.hidesBottomBarWhenPushed = YES;
		UIImage *backImg = [UIImage imageNamed:@"返回按钮.png"];
		if (backImg && (YES != viewController.navigationItem.hidesBackButton))
		{
			UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 8.75, 49, 26.5)];
			[backButton setImage:backImg forState:UIControlStateNormal];
            [backButton setBackgroundImage:[UIImage imageNamed:@"back-on.png"] forState:UIControlStateHighlighted];
//            [backButton setTitle:@"返回" forState:UIControlStateNormal];
//            [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [backButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
			[backButton addTarget:viewController action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
            [backButton setImageEdgeInsets:UIEdgeInsetsMake(0.0, -10, 0.0, 0.0)];
            [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -40, 0.0, 0.0)];
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
		}
	}
	[super pushViewController:viewController animated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
   
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!viewController.hidesBottomBarWhenPushed)
    {
        
//        [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];

    }
    else
    {
//        [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    }
}

@end
