//
//  CGRootViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "CGRootViewController.h"
#import "CGRootTableViewController.h"
#import "CYLSearchBar.h"

@interface CGRootViewController ()<UISearchBarDelegate>

@property (nonatomic,strong) CYLSearchBar *mySearchBar;

@end

@implementation CGRootViewController

@synthesize mySearchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self mySearchBar]];
    
    CGRootTableViewController *rootView = [CGRootTableViewController new];
    [self.view addSubview:rootView.view];
    [self addChildViewController:rootView];
    
    [self addTitleRightView];
    // Do any additional setup after loading the view.
}

- (CYLSearchBar *)mySearchBar {
    if (mySearchBar == nil) {
        mySearchBar                     = [[CYLSearchBar alloc]initWithFrame:CGRectMake(0, 64, MainWidth, 44)];
        mySearchBar.delegate            = self;
    }
    return mySearchBar;
    
}

- (void)addTitleRightView {
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:(CGRect){0,10,160,60}];
    leftButton.backgroundColor = [UIColor clearColor];
    [leftButton setTitleColor:[UIColor colorWithHexString:@""] forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [leftButton setTitle:@"南宁市 青秀区" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 110, 0, 0)];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    [leftButton addActionHandler:^(NSInteger tag){
        DLog(@"我来了");
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    UIButton *rightButtonForSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButtonForSearch setFrame:(CGRect){0,10,60,60}];
    rightButtonForSearch.backgroundColor = [UIColor clearColor];
    [rightButtonForSearch setImage:[UIImage imageNamed:@"fab.png"] forState:UIControlStateNormal];
    [rightButtonForSearch setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
    [rightButtonForSearch addActionHandler:^(NSInteger tag){
        DLog(@"我来了");
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButtonForSearch];
    
}

//searchBar开始编辑时改变取消按钮的文字
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    mySearchBar.showsCancelButton = YES;
    
    NSArray *subViews;
    
    if (IOS7) {
        subViews = [(mySearchBar.subviews[0]) subviews];
    }
    else {
        subViews = mySearchBar.subviews;
    }
    
    for (id view in subViews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton* cancelbutton = (UIButton* )view;
            [cancelbutton setTitle:  @"取消" forState:UIControlStateNormal];
            [cancelbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
        }
    }
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    return YES;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    //搜尋結束後，恢復原狀
    [UIView animateWithDuration:1.0 animations:^{
        //        _tableView.frame = CGRectMake(0, is_IOS_7?64:44, 320, SCREEN_HEIGHT-64);
    }];
    
     mySearchBar.showsCancelButton = NO;
    
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    
}



- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    // TODO - dynamically update the search results here, if we choose to do that.
    
    
    
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
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
