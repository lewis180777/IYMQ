//
//  SetUpTooViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/7.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SetUpTooViewController.h"
#import "CHcomatViewController.h"

@interface SetUpTooViewController ()

@property (strong, readwrite, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) REDateTimeItem *BMTimeItem;
@property (strong, readwrite, nonatomic) REDateTimeItem *HDTimeItem;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation SetUpTooViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建活动";
    
    // Create manager
    //
    self.manager = [[RETableViewManager alloc] initWithTableView:self.myTableView];
    
    // Add a section
    //
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    
    self.BMTimeItem = [REDateTimeItem itemWithTitle:@"报名截止时间:" value:nil placeholder:@"时间选择" format:@"MM/dd/yyyy hh:mm a" datePickerMode:UIDatePickerModeDateAndTime];
    self.BMTimeItem.validators = @[@"presence"];
    
    self.HDTimeItem = [REDateTimeItem itemWithTitle:@"活动时间:" value:nil placeholder:@"时间选择" format:@"MM/dd/yyyy hh:mm a" datePickerMode:UIDatePickerModeDateAndTime];
    self.HDTimeItem.validators = @[@"presence"];

    
    [section addItem:self.BMTimeItem];
    [section addItem:self.HDTimeItem];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NextEven:(id)sender {
    CHcomatViewController *comatView = [[CHcomatViewController alloc]init];
    [self.navigationController pushViewController:comatView animated:YES];
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
