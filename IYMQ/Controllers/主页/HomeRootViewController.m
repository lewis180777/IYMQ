//
//  HomeRootViewController.m
//  WoEGo
//
//  Created by 陈亦海 on 15/4/1.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import "HomeRootViewController.h"

@interface HomeRootViewController (){
    UILabel *label;
}

@end

@implementation HomeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"UDID:%@",[ComponentsFactory getUUID]);
    label = [UILabel new];
    label.frame = CGRectMake(80, 80, 100, 60);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self performSelector:@selector(aaa) withObject:nil];
//    [event setValue:self forKey:@"my"];
//    
//    [[self rdv_tabBarController] setSelectedIndex:2];
    
//    [UIView beginAnimations:@"animation" context:nil];
//    [UIView setAnimationDuration:1.0f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
//    [UIView commitAnimations];
   
//    [CoreAnimationEffect animationEaseOut:label ];
//    [CoreAnimationEffect animationMoveDown:label duration:3];
//    [CoreAnimationEffect showAnimationType: kCATransitionFade withSubType: kCATransitionFromRight duration:3 timingFunction:kCAMediaTimingFunctionLinear view:label];
    
    //开始一个动画块，第一个参数为动画块标识
//    [UIView beginAnimations:@"animationID" context:nil];
//    [UIView setAnimationDuration:0.5f];
//    //设置动画的持续时间
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    //设置动画块中的动画属性变化的曲线，此方法必须在beginAnimations方法和commitAnimations，默认即为UIViewAnimationCurveEaseInOut效果。详细请参见UIViewAnimationCurve
//    [UIView setAnimationRepeatAutoreverses:NO];//设置是否自动反转当前的动画效果
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];//设置过渡的动画效果，此处第一个参数可使用上面5种动画效果
//    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];//页面翻转
//    [UIView commitAnimations];//提交动画
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.5f;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionMoveIn;//设置上面4种动画效果
//    animation.subtype = kCATransitionFromLeft;
//    //设置动画的方向，有四种，分别为kCATransitionFromRight、kCATransitionFromLeft、kCATransitionFromTop、kCATransitionFromBottom
//    [self.view.layer addAnimation:animation forKey:@"animationID"];
    
//    [CoreAnimationEffect movepoint:CGPointMake(80, 180) onView:label];
//    [CoreAnimationEffect rotation:10 degree:7 direction:4 repeatCount:2 onView:label];
    [CoreAnimationEffect zoomIn:label andAnimationDuration:3];
    
       
}


@end
