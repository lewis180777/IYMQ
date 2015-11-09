//
//  HDRootViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/5.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDRootViewController.h"
#import "HDRootTableViewController.h"
#import "SetUpViewController.h"


@interface HDRootViewController ()

@end

@implementation HDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addHearView];
    
    HDRootTableViewController *rootView = [[HDRootTableViewController alloc]init];
    [self.view addSubview:rootView.view];
    [self addChildViewController:rootView];
    
    [self addTitleRightView];
}

- (void)addHearView {
    UIView *hearview = [UIView new];
    [hearview setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [self.view addSubview:hearview];
    
    [hearview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@0);
        make.top.mas_equalTo(@64);
        make.size.mas_equalTo(CGSizeMake(MainWidth, 44));  //设置大小,不设置其他的默认是xy都为0
    }];
    
   UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [hearview addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(hearview.center);
        make.size.mas_equalTo(CGSizeMake(1, 30));
    }];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor clearColor];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [leftButton setTitle:@"南宁市 兴宁区" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
    [leftButton setImage:[UIImage imageNamed:@"down2.png"] forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 120, 0, 0)];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    [leftButton addActionHandler:^(NSInteger tag){
        DLog(@"南宁市本地");

    }];
    [hearview addSubview:leftButton];
    
    UIButton *todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    todayButton.backgroundColor = [UIColor clearColor];
    [todayButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [todayButton setTitle:@"今天" forState:UIControlStateNormal];
    [todayButton setImage:[UIImage imageNamed:@"down2.png"] forState:UIControlStateNormal];
    [todayButton setImageEdgeInsets:UIEdgeInsetsMake(0, 120, 0, 0)];
    [todayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    [todayButton addActionHandler:^(NSInteger tag){
        DLog(@"南宁市本地今天");
        
    }];
    [hearview addSubview:todayButton];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(MainWidth / 2, 44));
    }];
    
    [todayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(MainWidth / 2) );
        make.top.mas_equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(MainWidth / 2, 44));
    }];
    


    
}

- (void)addTitleRightView {

    __typeof (&*self) __weak weakSelf = self;

    UIButton *rightButtonForSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButtonForSearch setFrame:(CGRect){0,10,60,60}];
    rightButtonForSearch.backgroundColor = [UIColor clearColor];
    [rightButtonForSearch setImage:[UIImage imageNamed:@"fab.png"] forState:UIControlStateNormal];
    [rightButtonForSearch setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
    [rightButtonForSearch addActionHandler:^(NSInteger tag){
        DLog(@"我来了");
        
        SetUpViewController *setUp = [[SetUpViewController alloc]initWithNibName:@"SetUpViewController" bundle:nil];
        
        setUp.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:setUp animated:YES];
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
