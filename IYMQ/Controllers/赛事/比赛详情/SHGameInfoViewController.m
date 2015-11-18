//
//  SHGameInfoViewController.m
//  IYMQ
//
//  Created by Elaine on 15--18.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SHGameInfoViewController.h"
#import "SHGameHeadTableViewCell.h"

#define addButtonWH 72

@interface SHGameInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *gameTableView;

@property (strong, nonatomic) NSMutableArray *arrayData;

@property (strong, nonatomic) UIButton *addButton;  // 加号按钮

@end

@implementation SHGameInfoViewController

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"比赛详情";
    
    [self loadAddIconButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - 创建底部加号
- (void)loadAddIconButton
{
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(MainWidth - 20, MainHeight - 20, addButtonWH, addButtonWH)];
    addButton.transform = CGAffineTransformMakeRotation(M_PI_4);
    [addButton setBackgroundImage:[UIImage imageNamed:@"jiahao"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

#pragma mark - UITableView Delegate and Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return 0;
}

#pragma mark - 加号按钮点击
- (void)addButtonClicked
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 101;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHGameHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHGameHeadCellIndex"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
