//
//  QHinfoViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/9.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHinfoViewController.h"
#import "QHinfoItem.h"
#import "QHinfoModel.h"

@interface QHinfoViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation QHinfoViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    self.manager[@"QHinfoItem"] = @"QHinfoCell";
    [self addItems];
    [self addSecondItens];
    [self addBotomView];
    // Do any additional setup after loading the view.
}

- (void)addItems
{

    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"   "];
    [section setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]];
    [self.manager addSection:section];
    for (int i = 0; i < 3; i++) {
        
        QHinfoModel *list = [QHinfoModel new];
        
        
        list.dextString = i == 0 ? @"常驻球馆:": i == 1 ? @"简介:" :@"会员制度:";
        list.nameString = i == 0 ? @"狮山羽毛球馆": i == 1 ? @"简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容" :@"简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容";
        
        
        
        [section addItem:[QHinfoItem itemWithQHinfoModel:list]];
        

    }
    
//    [self.manager addSectionsFromArray:items];  //添加整个数组RETableViewSection
}

- (void)addSecondItens {
    RETableViewSection *section = [RETableViewSection sectionWithHeaderView:[self viewForsection]];
    [section setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]];
    [self.manager addSection:section];

}

- (UIView *)viewForsection {
    UIView *botomView = [UIView new];
    botomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    botomView.frame = (CGRect){0 ,0,MainWidth,75};
    [self.view addSubview:botomView];
    
     UILabel *label = [UILabel initLabelText:@"免责声明：加入我们，代表您同意如下免责条款。" sizeFont:14.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    label.frame = (CGRect){10 ,10,MainWidth,25};
    [botomView addSubview:label];
    
    UIButton *manImage = [UIButton new];
    [manImage setFrame:(CGRect){10,40,MainWidth - 150,28}];
    manImage.backgroundColor = [UIColor clearColor];
    [manImage setImage:[UIImage imageNamed:@"勾选.png"] forState:UIControlStateNormal];
    [manImage setTitle:@"我已同意《免责条款》" forState:UIControlStateNormal];
    [manImage setTitleColor:[UIColor colorWithHexString:@"#4A90E2"] forState:UIControlStateNormal];
    [manImage setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [manImage addActionHandler:^(NSInteger tag) {
        
    }];
    [botomView addSubview:manImage];
    
    return botomView;
}

- (void)addBotomView {
   
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"加入球会" forState:UIControlStateNormal];
//    sureBtn.layer.masksToBounds = YES;
//    sureBtn.layer.cornerRadius = 4.0f;
    sureBtn.frame = (CGRect){0 ,MainHeight - 64,MainWidth,44};
    [sureBtn addActionHandler:^(NSInteger tag) {
        
    }];
    [self.view addSubview:sureBtn];
    
    //    [self.tableView setTableFooterView:botomView];
    
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
