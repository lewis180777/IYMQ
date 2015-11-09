//
//  MemberCenterRootViewController.m
//  WoEGo
//
//  Created by 陈亦海 on 15/4/1.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import "MemberCenterRootViewController.h"

@interface MemberCenterRootViewController ()

@end

@implementation MemberCenterRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"会员中心";
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(240, 380, 20, 20);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animation];
    //设置属性值
    animation.values=[NSArray arrayWithObjects:
                      (id)self.view.backgroundColor,
                      (id)[UIColor redColor].CGColor,
                      (id)[UIColor yellowColor].CGColor,
                      (id)[UIColor blackColor].CGColor,nil];
    animation.duration=2;
    animation.autoreverses=YES;
    //把关键帧添加到layer中
    [self.view.layer addAnimation:animation forKey:@"backgroundColor"];

    [self animationOfCAKeyframeAnimationPath];
}

-(void)animationOfCAKeyframeAnimationPath
{
    //初始化一个View，用来显示动画
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    
    CAKeyframeAnimation *ani=[CAKeyframeAnimation animation];
    //初始化路径
    CGMutablePathRef aPath=CGPathCreateMutable();
    //动画起始点
    CGPathMoveToPoint(aPath, nil, 20, 20);
    CGPathAddCurveToPoint(aPath, nil,
                          60, 30,//控制点
                          180, 80,//控制点
                          240, 380);//控制点
    
    ani.path=aPath;
    ani.duration=10;
    //设置为渐出
    ani.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //自动旋转方向
    ani.rotationMode = @"auto";
    
    [redView.layer addAnimation:ani forKey:@"position"];
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
