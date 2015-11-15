//
//  HDorCommanageViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/11.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDorCommanageViewController.h"

@interface HDorCommanageViewController ()<RFSegmentViewDelegate,RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation HDorCommanageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RFSegmentView* segmentView = [[RFSegmentView alloc] initWithFrame:CGRectMake(0, 0, MainWidth / 2, 40) items:@[@"活动管理",@"申诉管理"]];
    segmentView.backgroundColor = [UIColor clearColor];
    segmentView.tintColor = [UIColor whiteColor];
    segmentView.delegate = self;
    self.navigationItem.titleView = segmentView;
    
    //
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    // Map item to a cell
    //
    self.manager[@"HDlistItem"] = @"HDlistCell"; // which is the same as
//    [self.manager registerClass:@"HDlistItem" forCellWithReuseIdentifier:@"HDlistCell"];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view.
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


- (void)segmentViewSelectIndex:(NSInteger)index {
    
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
