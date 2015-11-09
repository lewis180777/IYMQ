//
//  SearchRootViewController.m
//  WoEGo
//
//  Created by 陈亦海 on 15/4/1.
//  Copyright (c) 2015年 陈亦海. All rights reserved.
//

#import "SearchRootViewController.h"
#import "XZLargeImageDisplayer.h"


@interface SearchRootViewController ()

@end

@implementation SearchRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"搜索";
    
    //初始化一个View，用来显示动画
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    
    [UIView animateWithDuration:3 //时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionTransitionCurlUp//动画效果
                     animations:^{
                         
                         //动画设置区域
                         redView.backgroundColor=[UIColor blueColor];
                         redView.frame=CGRectMake(50, 50, 200, 200);
                         redView.alpha=0.5;
                         
                     } completion:^(BOOL finish){
                         //动画结束时调用
                         //............
                     }];
    
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //图片查看器
    NSArray *arrayImage = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=2ac39196718b4710ce2ffdc4f3cfc3b2/38e2e28fa0ec08fac15f7a105aee3d6d54fbda08.jpg",@"http://img4q.duitang.com/uploads/item/201502/09/20150209000105_8rNkQ.jpeg",@"http://img4q.duitang.com/uploads/item/201502/08/20150208235838_4MPWW.jpeg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=c3e94d4152da81cb4ee683c56267d0a4/bdef7ff3d7ca7bcb64c1629abd096b63f724a82b.jpg"];
    NSArray *arrayViews = @[[[UIView alloc]init],[[UIView alloc]init],[[UIView alloc]init],[[UIView alloc]init]];
    XZLargeImageDisplayer *displayer = [[XZLargeImageDisplayer alloc] init];
    [displayer showDisplayerWithPaths:arrayImage originViews:arrayViews defaultIndex:0 tapDismiss:YES];
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
