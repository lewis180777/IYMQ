//
//  HDbaomingTableViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDbaomingTableViewController.h"
#import "BMrenView.h"
#import "PayStyleView.h"
@interface HDbaomingTableViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation HDbaomingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动报名";
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#F0F0F0"]];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"#F0F0F0"]];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    RETableViewSection *basicControlsSection = [RETableViewSection sectionWithHeaderTitle:@"报名人数"];
    [self.manager addSection:basicControlsSection];
    
    [basicControlsSection setFooterView:[[BMrenView alloc]init]];
    
//    [basicControlsSection addItem:[BMrenItem itemWithBMrenView:[[BMrenView alloc]init]]];
    
    RETableViewSection *basicControlsSection2 = [RETableViewSection sectionWithHeaderTitle:@"支付方式"];
    [self.manager addSection:basicControlsSection2];
    
    [basicControlsSection2 setFooterView:[[PayStyleView alloc]init]];

    
    [self addBotomView];
}

- (void)addBotomView {
    UIView *botomView = [UIView new];
    botomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    botomView.frame = (CGRect){0 ,MainHeight - 80 - 64,MainWidth,80};
    [self.view addSubview:botomView];
    
    UILabel *label = [UILabel initLabelText:@"合计:" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    label.frame = (CGRect){30 ,33,45,30};
    UILabel *allMoney = [UILabel initLabelText:@"35 元" sizeFont:20.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#D14946"]];
    allMoney.frame = (CGRect){90 ,27,105,40};
    [botomView addSubview:label];
    [botomView addSubview:allMoney];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor colorWithHexString:@"#D14946"];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"确定支付" forState:UIControlStateNormal];
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 4.0f;
    sureBtn.frame = (CGRect){MainWidth - 140 ,20,100,44};
    [sureBtn addActionHandler:^(NSInteger tag) {
    }];
    [botomView addSubview:sureBtn];
    
//    [self.tableView setTableFooterView:botomView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
