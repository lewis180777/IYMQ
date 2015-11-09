//
//  ChoiceSiteViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "ChoiceSiteViewController.h"
#import "SiteItem.h"
#import "SiteModle.h"

@interface ChoiceSiteViewController () <RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation ChoiceSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"地点选择";
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    self.manager[@"SiteItem"] = @"SiteCell";
    
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, 44)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor clearColor];
     sureBtn.frame = (CGRect){0 ,0,MainWidth,44};
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [sureBtn setImage:[UIImage imageNamed:@"down2.png"] forState:UIControlStateNormal];
    sureBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [sureBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 320, 0, 0)];
    [sureBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -250, 0, 0)];
    [sureBtn setTitle:@"南宁市 青秀区" forState:UIControlStateNormal];
   
    [sureBtn addActionHandler:^(NSInteger tag) {
        
    }];
    [backgroundView addSubview:sureBtn];

    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderView:backgroundView];
    [section setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]];
    
    [self.manager addSection:section];
    
    for (int i = 0; i < 12; i++) {
        
        SiteModle *list = [SiteModle new];
        list.codeString = SiteCode;
        list.nameString = @"狮山羽毛球馆";
        list.addressString = @"广西南宁平绣去大学路";
        list.juliString = @"8KM";
       
        RETableViewSection *section2 = [RETableViewSection section];
        //        RETableViewSection *section = [RETableViewSection section];
        [self.manager addSection:section2];
        
        // Add item (image)
        //
        [section2 addItem:[SiteItem itemWithSiteModle:list]];
    }

    // Do any additional setup after loading the view.
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
