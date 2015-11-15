//
//  NewOrOldMemberViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/11.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "NewOrOldMemberViewController.h"
#import "QHMembetItem.h"

@interface NewOrOldMemberViewController ()<RETableViewManagerDelegate,RFSegmentViewDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;


@end

@implementation NewOrOldMemberViewController


@synthesize type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    RFSegmentView* segmentView = [[RFSegmentView alloc] initWithFrame:CGRectMake(0, 0, MainWidth / 2, 40) items:@[@"新加入",@"老会员"]];
    segmentView.backgroundColor = [UIColor clearColor];
    segmentView.tintColor = [UIColor whiteColor];
    segmentView.delegate = self;
    self.navigationItem.titleView = segmentView;
//    [listView addSubview:segmentView];
    
    [self initUi];

    // Do any additional setup after loading the view.
}

- (void)initUi{
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    self.manager[@"QHMembetItem"] = @"QHMemberCell";
    
    [self addItems];
    
    [self addBottomView];
}

- (void)segmentViewSelectIndex:(NSInteger)index {
    switch (index) {
        case 0:
            type = newCode;
            break;
        case 1:
            type = oldCode;
            break;
        default:
            break;
    }
    
    [self.manager removeAllSections];
    [self.tableView reloadData];
    self.manager.delegate = nil;
    self.manager = nil;
     [self initUi];
    
}

- (void)addItems
{
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderView:type == newCode ? [self titleView] : nil];
    [self.manager addSection:section];
    [section setFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, 1)]];
    for (int i = 0; i < 4; i++) {
        
        QHMemModel *list = [QHMemModel new];
        list.dextString = @"球龄： 5年   战斗力：3600";
        list.nameString = @"萌萌哒";
        list.imgString = @"球会.png";
    
        [section addItem:[QHMembetItem itemWithQHMemModel:list]];
    }
    
    
    
}


- (UIView *)titleView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0, 0, MainWidth, 64);
    
    UILabel *label = [UILabel initLabelText:@"新加入的会员是否审核" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    label.frame = CGRectMake(10, 10, 150, 30);
    [view addSubview:label];
    
    UISwitch *switchOn=[[UISwitch alloc] initWithFrame:CGRectMake(MainWidth - 70, 10, 60, 25)];
    switchOn.on =  NO;
    switchOn.onTintColor=[UIColor colorWithHexString:@"#D14946"];
    [switchOn addTarget:self action:@selector(switchOn:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:switchOn];
    
    UILabel *BGlabel = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#F0F0F0"] textColor:nil];
    BGlabel.frame = CGRectMake(0, 44, MainWidth, 20);
    [view addSubview:BGlabel];
    
    return view;
}

-(void)switchOn:(id)sender{
    UISwitch *Wu=(UISwitch *)sender;
    if(Wu.on){
        
    }else{
        
    }
}

- (void)addBottomView {
    if (type == oldCode) {
        
        UIButton *rightButtonForSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButtonForSearch setFrame:(CGRect){0,10,60,60}];
        rightButtonForSearch.backgroundColor = [UIColor clearColor];
        [rightButtonForSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightButtonForSearch setTitle:@"编辑" forState:UIControlStateNormal];
//        [rightButtonForSearch setImage:[UIImage imageNamed:@"fab.png"] forState:UIControlStateNormal];
//        [rightButtonForSearch setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
        [rightButtonForSearch addActionHandler:^(NSInteger tag){
            DLog(@"我来了");
            
        }];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButtonForSearch];
        
        return;
    }
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:nil];
    
    UIButton *pasButton = [UIButton bundleWithTitle:@"通过" BGColor:[UIColor colorWithHexString:@"#D14946"] titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textHighligtedColor:nil];
    pasButton.frame = CGRectMake(0, MainHeight - 44, MainWidth / 2, 44);
    [pasButton addActionHandler:^(NSInteger tag){
        
    }];
    
    [self.tableView addSubview:pasButton];
    
    UIButton *noPasButton = [UIButton bundleWithTitle:@"不通过" BGColor:[UIColor colorWithHexString:@"#FFFFFF"] titleColor:[UIColor colorWithHexString:@"#666666"] textHighligtedColor:nil];
    noPasButton.frame = CGRectMake(MainWidth / 2, MainHeight - 44, MainWidth / 2, 44);
    [noPasButton addActionHandler:^(NSInteger tag){
        
    }];
    
    [self.tableView addSubview:noPasButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
