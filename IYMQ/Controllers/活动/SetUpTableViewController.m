//
//  SetUpTableViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/7.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SetUpTableViewController.h"
#import "RETableViewOptionsController.h"

@interface SetUpTableViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) RETableViewSection *basicControlsSection;
@property (strong, readwrite, nonatomic) RETableViewSection *creditCardSection;
@property (strong, readwrite, nonatomic) RETextItem *textItem; //活动名称
@property (strong, readwrite, nonatomic) RETextItem *numItem; //联系方式

@end

@implementation SetUpTableViewController


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"#F0F0F0"]];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"#F0F0F0"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
//    self.manager.style.cellHeight = 12.0;
    
    self.manager.style.backgroundImageMargin = 10.0;
    // Add a section
    //
    self.basicControlsSection = [RETableViewSection sectionWithHeaderView:[[UIView alloc]initWithFrame:(CGRect){0,0,MainWidth,10}]];
    [self.manager addSection:self.basicControlsSection];
    
    // Add items
    //
    self.textItem = [RETextItem itemWithTitle:@"活动名称:" value:@"" placeholder:@"请输入活动名称"];
    self.textItem.validators = @[@"presence", @"length(1, 100)"];
    
    self.numItem = [RENumberItem itemWithTitle:@"联系方式:" value:@"" placeholder:@"请输入手机号码"];
    self.numItem.name = @"您的电话";
    self.numItem.keyboardType = UIKeyboardTypeNumberPad;
//    self.numItem.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.numItem.validators = @[@"presence", @"num"];
    
    [self.basicControlsSection addItem:self.textItem];
    
    [self.basicControlsSection addItem:[RETableViewItem itemWithTitle:@"活动地点：" accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES]; // same as [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        
    }]];

    

    self.creditCardSection = [RETableViewSection sectionWithHeaderView:[[UIView alloc]initWithFrame:(CGRect){0,0,MainWidth,10}]];
    [self.manager addSection:self.creditCardSection];
    
    [self.creditCardSection addItem:self.numItem];
    [self.creditCardSection addItem:self.textItem];
    
    

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

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
