//
//  CHcomatViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "CHcomatViewController.h"
#import "RETableViewOptionsController.h"

@interface CHcomatViewController ()<RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;


@end

@implementation CHcomatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建活动";
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    RETableViewSection *section = [RETableViewSection sectionWithHeaderView:[self hearView]];
    
    NSMutableArray *options = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i < 10; i++)
        [options addObject:[NSString stringWithFormat:@"业余%li级", (long) i]];
    
    // Present options controller
    //
    RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:[RETableViewItem item] options:options multipleChoice:NO completionHandler:^(RETableViewItem *selectedItem){
        
        NSLog(@"~~~~~~~~~~%@",selectedItem.title);
        [selectedItem deselectRowAnimated:YES];
        
//        [self.navigationController popViewControllerAnimated:YES];
        
//        [item reloadRowWithAnimation:UITableViewRowAnimationNone]; // same as [weakSelf.tableView reloadRowsAtIndexPaths:@[item.indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    optionsController.delegate = self;
    optionsController.style = section.style;
    if (self.tableView.backgroundView == nil) {
        optionsController.tableView.backgroundColor = self.tableView.backgroundColor;
        optionsController.tableView.backgroundView = nil;
    }
    
    // Push the options controller
    //
//    [self.navigationController pushViewController:optionsController animated:YES];
    [self.view addSubview:optionsController.view];
    [self addChildViewController:optionsController];
    
    
    
    [section setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]];
    
    [self.manager addSection:section];
    
    [self sureEven];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)hearView {
    
    UIView *hearView = [UIView new];
    hearView.backgroundColor = [UIColor clearColor];
    [hearView setFrame:CGRectMake(0, 0, MainWidth, 30)];
    
    UILabel *label = [UILabel initLabelText:@"战斗力要求" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
    [label setFrame:CGRectMake(10, 15, MainWidth, 25)];
    [hearView addSubview:label];
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor clearColor];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#4A90E2"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"查看战斗力说明" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
//    sureBtn.layer.masksToBounds = YES;
//    sureBtn.layer.cornerRadius = 4.0f;
    sureBtn.frame = (CGRect){MainWidth - 150 ,15,140,30};
    [sureBtn addActionHandler:^(NSInteger tag) {
    }];
    [hearView addSubview:sureBtn];
    
    return hearView;

}

- (void)sureEven {
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor whiteColor];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"完成创建" forState:UIControlStateNormal];
    sureBtn.frame = (CGRect){0 ,MainHeight - 44 - 64,MainWidth,44};
    [sureBtn addActionHandler:^(NSInteger tag) {
    }];
    [self.view addSubview:sureBtn];
}




@end
