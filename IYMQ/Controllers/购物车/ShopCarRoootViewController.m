//
//  ShopCarRoootViewController.m
//  WoEGo
//
//  Created by 陈亦海 on 15/4/1.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import "ShopCarRoootViewController.h"

@interface ShopCarRoootViewController ()

@end

@implementation ShopCarRoootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的购物车";
    //初始化一个View，用来显示动画
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    
    CABasicAnimation
    *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anim.duration
    = 1.f;
    anim.fromValue
    = [NSValue valueWithCGRect:CGRectMake(10,10,10,10)];
    anim.toValue
    = [NSValue valueWithCGRect:CGRectMake(10,10,200,200)];
    anim.byValue
    = [NSValue valueWithCGRect:redView.bounds];
    //
    anim.toValue = (id)[UIColor redColor].CGColor;
    //
    anim.fromValue =  (id)[UIColor blackColor].CGColor;
    
    anim.timingFunction
    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount
    = 1;
    anim.autoreverses
    = YES;
    
    [redView.layer
     addAnimation:anim forKey:nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
