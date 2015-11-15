//
//  QHSetupViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHSetupViewController.h"
#import "UITextView+PlaceHolder.h"

@interface QHSetupViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate> {
    UITextField *qiuhuiText;
    UITextView *jianjieView;
    UITextView *zhiduView;
    UIButton *cityButton;
    UIButton *qgButton;
}

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
    
    [tableView setTableFooterView:[self tableFootView]];
    
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

- (UIView *)tableFootView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    view.frame = CGRectMake(0, 10, MainWidth, 100);
    
    UILabel *label = [UILabel initLabelText:@"加入球会需审核" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    label.frame = CGRectMake(10, 20, 120, 30);
    [view addSubview:label];
    
    UISwitch *switchOn=[[UISwitch alloc] initWithFrame:CGRectMake(140, 20, 60, 25)];
    switchOn.on =  NO;
    switchOn.onTintColor=[UIColor colorWithHexString:@"#D14946"];
    [switchOn addTarget:self action:@selector(switchOn:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:switchOn];
    
    UIButton *manImage = [UIButton new];
    [manImage setFrame:(CGRect){10,60,MainWidth - 150,30}];
    manImage.backgroundColor = [UIColor clearColor];
    [manImage setImage:[UIImage imageNamed:@"勾选.png"] forState:UIControlStateNormal];
    [manImage setTitle:@"我已同意《免责条款》" forState:UIControlStateNormal];
    [manImage setTitleColor:[UIColor colorWithHexString:@"#4A90E2"] forState:UIControlStateNormal];
    [manImage setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [manImage addActionHandler:^(NSInteger tag) {
        
    }];
    [view addSubview:manImage];

    
    return view;
}

-(void)switchOn:(id)sender{
    UISwitch *Wu=(UISwitch *)sender;
    if(Wu.on){
        
    }else{
        
    }
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
        case 0:{
            label.text = @"球会名称:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            
            UITextField *textField = [UITextField new];
            textField.frame = CGRectMake(10, 5, MainWidth - 120, 30);
            textField.backgroundColor = [UIColor clearColor];
            textField.borderStyle = UITextBorderStyleNone;
            textField.delegate = self;
            textField.returnKeyType = UIReturnKeyDone;
            textField.placeholder = @"请输入球会名称";
            qiuhuiText = textField;
            [view addSubview:qiuhuiText];
        }
            break;
        case 1:{
            label.text = @"所在城市:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            UIButton *button = [UIButton bundleWithTitle:@"请选择城市" BGColor:[UIColor clearColor] titleColor:[UIColor colorWithHexString:@"#CCCCCC"] textHighligtedColor:nil];
            button.frame = CGRectMake(-30, 0, MainWidth - 200, 40);
            cityButton = button;
            [view addSubview:cityButton];
            [cityButton addActionHandler:^(NSInteger tag){
                
            }];
        }
            break;
        case 2:{
            label.text = @"常驻球馆:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 40);
            
            UIButton *button = [UIButton bundleWithTitle:@"请选择球馆" BGColor:[UIColor clearColor] titleColor:[UIColor colorWithHexString:@"#CCCCCC"] textHighligtedColor:nil];
            button.frame = CGRectMake(-30, 0, MainWidth - 200, 40);
            qgButton = button;
            [view addSubview:qgButton];
            [qgButton addActionHandler:^(NSInteger tag){
                
            }];

        }
            break;
        case 3:{
            label.text = @"球会简介:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 90);
            UITextView *textView = [[UITextView alloc] init];
            textView.frame = CGRectMake(10, 5, MainWidth - 120, 80);
            textView.backgroundColor = [UIColor clearColor];
            textView.font = [UIFont systemFontOfSize:18.0]; //注意先设置字体,再设置placeholder
            textView.placeholder = @"请填写简介";
            textView.delegate = self;
            textView.returnKeyType = UIReturnKeyDone;
            jianjieView = textView;
            [view addSubview:jianjieView];

        }
            break;
        case 4:{
            label.text = @"会员制度:";
            view.frame = CGRectMake(90, 5, MainWidth - 110, 90);
            
            UITextView *textView = [[UITextView alloc] init];
            textView.frame = CGRectMake(10, 5, MainWidth - 120, 80);
            textView.font = [UIFont systemFontOfSize:18.0]; //注意先设置字体,再设置placeholder
            textView.placeholder = @"请填写会员制度";
            textView.delegate = self;
            textView.returnKeyType = UIReturnKeyDone;
            zhiduView = textView;
            [view addSubview:zhiduView];
        }
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
