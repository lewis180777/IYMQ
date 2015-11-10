//
//  QHRootViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHRootViewController.h"
#import "QHRootTableViewController.h"
#import "QHSetupViewController.h"

@interface QHRootViewController ()

@end

@implementation QHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QHRootTableViewController *rootView = [QHRootTableViewController new];
    [self.view addSubview:rootView.view];
    [self addChildViewController:rootView];
    
    [self addTitleRightView];
    // Do any additional setup after loading the view.
}

- (void)addTitleRightView {
    
    UIButton *rightButtonForSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButtonForSearch setFrame:(CGRect){0,10,60,60}];
    rightButtonForSearch.backgroundColor = [UIColor clearColor];
    [rightButtonForSearch setImage:[UIImage imageNamed:@"fab.png"] forState:UIControlStateNormal];
    [rightButtonForSearch setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
    [rightButtonForSearch addActionHandler:^(NSInteger tag){
        DLog(@"我来了");
        QHSetupViewController *setup = [[QHSetupViewController alloc]init];
        [self.navigationController pushViewController:setup animated:YES];
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButtonForSearch];
    
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
