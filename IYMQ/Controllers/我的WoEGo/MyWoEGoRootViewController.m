//
//  MyWoEGoRootViewController.m
//  WoEGo
//
//  Created by 陈亦海 on 15/4/1.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import "MyWoEGoRootViewController.h"
#import "HomeRootViewController.h"


@interface MyWoEGoRootViewController ()

@end

@implementation MyWoEGoRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"我的沃易购";
    
    //创建一个CABasicAnimation对象
    CABasicAnimation *animation=[CABasicAnimation animation];
    //设置颜色
    animation.toValue=(id)[UIColor blueColor].CGColor;
    //动画时间
    animation.duration=1;
    //是否反转变为原来的属性值
    animation.autoreverses=YES;
    //把animation添加到图层的layer中，便可以播放动画了。forKey指定要应用此动画的属性
    [self.view.layer addAnimation:animation forKey:@"backgroundColor"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
     HomeRootViewController *firstViewController = [[HomeRootViewController alloc] init];
    firstViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:firstViewController animated:YES];
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.5f;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionPush;//设置上面4种动画效果
//    animation.subtype = kCATransitionFromTop;
//    //设置动画的方向，有四种，分别为kCATransitionFromRight、kCATransitionFromLeft、kCATransitionFromTop、kCATransitionFromBottom
//    [self.view.layer addAnimation:animation forKey:@"animationID"];
    
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    //开始动画
    [UIView beginAnimations:@"test" context:nil];
    //动画时长
    [UIView setAnimationDuration:1];
    /*
     *要进行动画设置的地方
     */
    
    redView.backgroundColor=[UIColor blueColor];
    redView.frame=CGRectMake(50, 50, 200, 200);
    redView.alpha=0.5;
    
    
    //动画结束
    [UIView commitAnimations];
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
