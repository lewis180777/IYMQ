//
//  QHMemberViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHMemberViewController.h"
#import "QHMembetItem.h"

@interface QHMemberViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation QHMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"球会成员";
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    self.manager[@"QHMembetItem"] = @"QHMemberCell";
    
    [self addItems];
    // Do any additional setup after loading the view.
}

- (void)addItems
{

    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"会长"];
    RETableViewSection *sectionToo = [RETableViewSection sectionWithHeaderTitle:@"成员"];
    [self.manager addSection:section];
    [self.manager addSection:sectionToo];
    
    for (int i = 0; i < 12; i++) {
        
        QHMemModel *list = [QHMemModel new];
        
        
        list.dextString = @"球龄： 5年   战斗力：3600";
        list.nameString = @"狮山羽毛球馆打啵";
        list.imgString = @"球会.png";

        [sectionToo addItem:[QHMembetItem itemWithQHMemModel:list]];
        
        if (i == 0) {
            [section addItem:[QHMembetItem itemWithQHMemModel:list]];

        }
        
    }
    
    
    

     
    
        


    
    //    [self.manager addSectionsFromArray:items];  //添加整个数组RETableViewSection
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
