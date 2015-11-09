//
//  HDRootTableViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/5.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDRootTableViewController.h"
#import "HDlistItem.h"
#import "HDlistModel.h"
#import "SHRootViewController.h"
#import "HDInfoViewController.h"

@interface HDRootTableViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation HDRootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:(CGRect){0,108,MainWidth,MainHeight - 158}];
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    // Create manager
    //
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    // Map item to a cell
    //
//    self.manager[@"HDlistItem"] = @"HDlistCell"; // which is the same as
    [self.manager registerClass:@"HDlistItem" forCellWithReuseIdentifier:@"HDlistCell"];
    
    // Set some UITableView properties
    //
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // Add table footer view
    //
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 58)];
    [self.tableView.tableFooterView addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 7, MainWidth, 44);
        button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [button setTitle:@"加载更多..." forState:UIControlStateNormal];
        [button addTarget:self action:@selector(loadMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
    
    [self addItems];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addItems
{
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i < 12; i++) {
        
        HDlistModel *list = [HDlistModel new];
        list.timeString = @"08.31(周二) 15：50";
        list.codeString = @"报名";
        list.imgString = @"fff";
        list.nameString = @"狮山羽毛球馆打啵";
        list.qiuguangString = @"狮山羽毛球馆";
        list.qiuhuiString = @"i羽毛球球会";
        list.juliString = @"8KM";
        list.countString = @"10/20";
        list.manString = @"黄婷婷";
                [items addObject:list];
        
    }
    
        
        
    for (HDlistModel *dictionary in items) {
        // Create section with a header view
        //
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, 10)];
        backgroundView.backgroundColor = [UIColor clearColor];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        RETableViewSection *section = [RETableViewSection sectionWithHeaderView:backgroundView];
        //        RETableViewSection *section = [RETableViewSection section];
        [self.manager addSection:section];
        
        // Add item (image)
        //
        [section addItem:[HDlistItem itemWithHDlistModel:dictionary]];
        
//        [items addObject:section];
    }
    
//    [self.manager addSectionsFromArray:items];  //添加整个数组RETableViewSection
}

#pragma mark -
#pragma mark Button actions

- (void)loadMoreButtonPressed:(id)sender
{
    
    [self addItems];
    [self.tableView reloadData];
}



#pragma mark - Table view data source

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 20.0f;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"我点击了%@  总的多少  %lu",indexPath,(unsigned long)self.manager.sections.count);
       //     [self.manager removeAllSections];  //删除所有的数据源
    //    [self.manager removeSectionAtIndex:indexPath.section];  //删除其中某一条
    
//    [self.tableView reloadData];
    
    HDInfoViewController *rootView = [[HDInfoViewController alloc]init];
    [self.navigationController pushViewController:rootView animated:YES];
}


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
