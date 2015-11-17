//
//  HDorCommanageViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/11.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDorCommanageViewController.h"
#import "HDManagementItem.h"
#import "HDManagementModel.h"
#import "SSuManagementModel.h"
#import "SSuMangementItem.h"

@interface HDorCommanageViewController ()<RFSegmentViewDelegate,RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;
//@property (strong, readwrite, nonatomic) RETableViewManager *managerToo;

@end

@implementation HDorCommanageViewController

@synthesize type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RFSegmentView* segmentView = [[RFSegmentView alloc] initWithFrame:CGRectMake(0, 0, MainWidth / 2, 40) items:@[@"活动管理",@"申诉管理"]];
    segmentView.backgroundColor = [UIColor clearColor];
    segmentView.tintColor = [UIColor whiteColor];
    segmentView.delegate = self;
    self.navigationItem.titleView = segmentView;
    


    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addItems];
    // Do any additional setup after loading the view.
}

- (void)addItems
{
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
//    self.managerToo = [[RETableViewManager alloc] initWithTableView:self.tableView];
//    self.managerToo.delegate = self;

    
    //**********活动管理
    NSMutableArray *items = [NSMutableArray array];
    
    for (int i = 0; i < 12; i++) {
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, 10)];
        backgroundView.backgroundColor = [UIColor clearColor];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        RETableViewSection *section = [RETableViewSection sectionWithHeaderView:backgroundView];
        //        RETableViewSection *section = [RETableViewSection section];
       
        
        if(type == HDTypeMan) {


            self.manager[@"HDManagementItem"] = @"HDManagementCell";
            
            HDManagementModel *list = [HDManagementModel new];
            list.timeString = @"08.31(周二) 15：50";
            list.codeString = @"报名";
            list.imgString = @"fff";
            list.nameString = @"狮山羽毛球馆打啵";
            list.qiuhuiString = @"i羽毛球球会";
            list.juliString = @"8KM";
            list.countString = @"10/20";
            
            [section addItem:[HDManagementItem itemWithHDManagementModel:list]];
            [self.manager addSection:section];

        }
        else if (type == SSTypeMen) {

            self.manager[@"SSuMangementItem"] = @"SSuMangementCell";
            
            SSuManagementModel *list = [SSuManagementModel new];

            list.codeString = @"报名";
            list.textString = @"狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵狮山羽毛球馆打啵";
            list.teger = 2;

            [section addItem:[SSuMangementItem itemWithSSuManagementModel:list]];
            
            [self.manager addSection:section];
        }
        
        [items addObject:section];
    }
    
//    [self.manager addSectionsFromArray:items];  //添加整个数组RETableViewSection
}


- (void)segmentViewSelectIndex:(NSInteger)index {
    switch (index) {
        case 0:
            type = HDTypeMan;

            break;
            
        case 1:
            type = SSTypeMen;

            break;
            
        default:
            break;
    }
    
    [self.manager removeAllSections];
    [self.tableView reloadData];
    
    self.manager.delegate = nil;
    self.manager = nil;
    
    [self addItems];
    
    
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
