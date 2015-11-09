//
//  SHRootViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/3.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SHRootViewController.h"
#import "BasicTableViewController.h"

@interface SHRootViewController ()

@property (nonatomic,strong) UITableView *myTableView;

@end

@implementation SHRootViewController

@synthesize myTableView;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addTitleview];
//    [self.view addSubview:self.myTableView];
    
    BasicTableViewController *basicTableView = [[BasicTableViewController alloc]init];
    [self.view addSubview:basicTableView.view];
    [self addChildViewController:basicTableView];
    
    // Do any additional setup after loading the view.
}

- (void)addTitleview {
    
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithHexString:@"#D14946" withAlpha:0.8];
    [self.view addSubview:titleView];
//    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.size.mas_equalTo(CGSizeMake(MainWidth, 70));  //设置大小,不设置其他的默认是xy都为0

//        make.edges.equalTo(self.view).insets(padding);  //设置边界
    }];
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:10.0f backgroundColor:[UIColor colorWithHexString:@"#FFFFFF"] textColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [titleView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@25);
        make.bottom.mas_equalTo(@2);
        make.size.mas_equalTo(CGSizeMake(60, 4));  //设置大小
    }];

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor clearColor];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [leftButton setTitle:@"推荐" forState:UIControlStateNormal];
    [leftButton addActionHandler:^(NSInteger tag){
        DLog(@"推荐");
        [self animationLabel:label withLeft:25];
    }];
    [titleView addSubview:leftButton];
    
    
    UIButton *LoctiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    LoctiteButton.backgroundColor = [UIColor clearColor];
    [LoctiteButton setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [LoctiteButton setTitle:@"本地" forState:UIControlStateNormal];
    [LoctiteButton addActionHandler:^(NSInteger tag){
        DLog(@"本地");
        [self animationLabel:label withLeft:95];
    }];
    [titleView addSubview:LoctiteButton];
    
    int padding1 = 15;
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@25);
        make.left.equalTo(titleView.mas_left).with.offset(30);
//        make.right.equalTo(LoctiteButton.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@50);
    }];
    [LoctiteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@25);
        make.left.equalTo(leftButton.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@40);
        make.width.mas_equalTo(@50);
    }];
    

    UIButton *rightButtonForSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButtonForSearch.backgroundColor = [UIColor clearColor];
    [rightButtonForSearch setImage:[UIImage imageNamed:@"菜单.png"] forState:UIControlStateNormal];
    [rightButtonForSearch addActionHandler:^(NSInteger tag){
            DLog(@"我来了");
    }];
    [titleView addSubview:rightButtonForSearch];
    
    [rightButtonForSearch mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(@25);
         make.right.mas_equalTo(@-5);
         make.size.mas_equalTo(CGSizeMake(60, 40));  //设置大小
    }];

}

- (void)animationLabel:(UILabel *)label withLeft:(float)foat {
//    [CoreAnimationEffect moveX:1 X:@100 onView:label];
    [UIView animateWithDuration:2 //时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionTransitionCurlUp//动画效果
                     animations:^{
                         
                         [label mas_updateConstraints:^(MASConstraintMaker *make) {
                              make.left.mas_equalTo(foat);
                         }];
                         //动画设置区域
                         
                     } completion:^(BOOL finish){
                         //动画结束时调用
                         //............
                     }];

}

- (UITableView *)myTableView {
    if (myTableView == nil) {
        myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        myTableView.backgroundColor = [UIColor clearColor];
        myTableView.delegate = self;
        myTableView.dataSource = self;
    }
    return myTableView;
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
