//
//  SetUpViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/7.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SetUpViewController.h"
#import "SetUpTooViewController.h"
#import "ChoiceSiteViewController.h"

@interface SetUpViewController ()

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建活动";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextEven:(id)sender {
    SetUpTooViewController *setup = [[SetUpTooViewController alloc]initWithNibName:@"SetUpTooViewController" bundle:nil];
    setup.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setup animated:YES];
}
- (IBAction)sureSiteEven:(id)sender {
    
    ChoiceSiteViewController *siteView = [[ChoiceSiteViewController alloc]init];
    [self.navigationController pushViewController:siteView animated:YES];
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
