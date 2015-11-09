//
//  MainTabBarController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/2.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "MainTabBarController.h"
#import "BasicViewController.h"
#import "SHRootViewController.h"
#import "HDRootViewController.h"
#import "QHRootViewController.h"
#import "CGRootViewController.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController




+ (instancetype)sharedInstance {
    
    static MainTabBarController *sharedBussineDataService = nil;
    static dispatch_once_t pred = 0;
    
    dispatch_once(&pred, ^{
        sharedBussineDataService = [[MainTabBarController alloc] init];

    });
    
    return sharedBussineDataService;
}

- (id)init
{
    self = [super init];
    
    if ( self ) {
        self.tabBar.backgroundColor = [UIColor colorWithHexString:@"#D9D9D9"];

    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")){
        [self.tabBar setBackgroundImage:[UIImage imageNamed:@""]]; //设置tabBar背景色
    }
    
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0") && SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"7.0")){
        self.tabBar.tintColor = [UIColor colorWithHexString:@"#D14946"];//tabber下面选择图标的颜色
    }else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        [self.tabBar setTintColor:[UIColor colorWithHexString:@"#D14946"]];//tabber下面选择图标的颜色
        
    }
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (UITabBarItem *)initwithTitle:(NSString *)title withImage:(NSString *)Image {
    UITabBarItem *tabBarItem = nil;
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0") && SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"7.0")){
       tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                           image:[UIImage imageNamed:Image]
                                                             tag:0];
//       [tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"FirstPage_31-on.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"FirstPage_31.png"]];
    }else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
       tabBarItem=[[UITabBarItem alloc] initWithTitle:title
                                                           image:[UIImage imageNamed:Image]
                                                             tag:0];
    }else{
       tabBarItem=[[UITabBarItem alloc] initWithTitle:title
                                                           image:[UIImage imageNamed:Image]
                                                             tag:0];
    }
    return tabBarItem;

}

- (CustomNavigationController *)initwithRootview:(UIViewController *)viewControll {
    CustomNavigationController *customNav = [[CustomNavigationController alloc]initWithRootViewController:viewControll];
    return customNav;
}

- (void)setAppRootTabBarcontrollers:(NSInteger )integer {
    SHRootViewController *rootView1 = [[SHRootViewController alloc]init];
    HDRootViewController *rootView2 = [[HDRootViewController alloc]init];
    QHRootViewController *rootView3 = [[QHRootViewController alloc]init];
    CGRootViewController *rootView4 = [[CGRootViewController alloc]init];
    BasicViewController *rootView5 = [[BasicViewController alloc]init];
    
    rootView1.tabBarItem = [self initwithTitle:@"赛事" withImage:@"赛事.png"];
    rootView2.tabBarItem = [self initwithTitle:@"活动" withImage:@"活动.png"];
    rootView3.tabBarItem = [self initwithTitle:@"球会" withImage:@"球会.png"];
    rootView4.tabBarItem = [self initwithTitle:@"场馆" withImage:@"场馆.png"];
    rootView5.tabBarItem = [self initwithTitle:@"我的" withImage:@"我的.png"];
    
    rootView1.title = @"赛事";
    rootView2.title = @"活动";
    rootView3.title = @"球会";
    rootView4.title = @"场馆";
    rootView5.title = @"我的";
    
    
    CustomNavigationController *customNav1 = [[CustomNavigationController alloc]initWithRootViewController:rootView1];
    CustomNavigationController *customNav2 = [[CustomNavigationController alloc]initWithRootViewController:rootView2];
    CustomNavigationController *customNav3 = [[CustomNavigationController alloc]initWithRootViewController:rootView3];
    CustomNavigationController *customNav4 = [[CustomNavigationController alloc]initWithRootViewController:rootView4];
    CustomNavigationController *customNav5 = [[CustomNavigationController alloc]initWithRootViewController:rootView5];
    
     NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:customNav1,customNav2,customNav3,customNav4,customNav5,nil];
     self.viewControllers = array;
     self.selectedIndex = integer;
}

- (void)setRootTabBarcontrollers:(NSMutableArray *)viewControllers selectedIndex:(NSInteger )integer{
    self.viewControllers = viewControllers;
    
}

- (void)setRootselectedIndex:(NSInteger )integer {
    self.selectedIndex = integer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
