//
//  QHSetupViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHSetupViewController.h"

@interface QHSetupViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QHSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建球会";
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    CGRect frame = self.view.frame;
    frame.size.height -= 50;
    [tableView setFrame:frame];
    
    [self.view addSubview:tableView];
    
    [self addBottomView];
    // Do any additional setup after loading the view.
}

- (void)addBottomView {
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"创建球会" forState:UIControlStateNormal];
    //    sureBtn.layer.masksToBounds = YES;
    //    sureBtn.layer.cornerRadius = 4.0f;
    sureBtn.frame = (CGRect){0 ,MainHeight - 44,MainWidth,44};
    [sureBtn addActionHandler:^(NSInteger tag) {
        
    }];
    
    [self.view addSubview:sureBtn];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
        case 1:
        case 2:
            return 50;
            break;
        case 3:
        case 4:
            return 100;
            break;
            
        default:
            break;
    }
    
    return 44;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SearCell = @"SearCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SearCell];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SearCell] ;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        label.frame = CGRectMake(10, 10, 70, 30);
        label.tag = 266;
        [cell addSubview:label];
        
        UIView *right = [[UIView alloc]initWithFrame:CGRectZero];
        right.backgroundColor = [UIColor whiteColor];
        right.tag = 267;
        right.layer.masksToBounds = YES;
        right.layer.cornerRadius = 3.0f;
        [cell addSubview:right];
        
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    UILabel *label = (UILabel *)[cell viewWithTag:266];
    UIView *view = (UIView *)[cell viewWithTag:267];
    NSInteger row = indexPath.row;
    
    switch (row) {
        case 0:
            label.text = @"球会名称:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            break;
        case 1:
            label.text = @"所在城市:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            break;
        case 2:
            label.text = @"常驻球馆:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            break;
        case 3:
            label.text = @"球会简介:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 90);
            break;
        case 4:
            label.text = @"会员制度:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 90);
           
            break;
            
        default:
            break;
    }
    
    
    return cell;
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
