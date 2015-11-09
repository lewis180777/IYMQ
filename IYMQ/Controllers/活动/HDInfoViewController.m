//
//  HDInfoViewController.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDInfoViewController.h"
#import "SiteItem.h"
#import "SiteModle.h"
#import "InfoHearView.h"
#import "HDpeoleView.h"

@interface HDInfoViewController ()<RETableViewManagerDelegate,TTTAttributedLabelDelegate>

@property (strong, readwrite, nonatomic) RETableViewManager *manager;


@end

@implementation HDInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动详情";
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;
    
    self.manager[@"SiteItem"] = @"SiteCell";
    

    RETableViewSection *section = [RETableViewSection sectionWithHeaderView:[InfoHearView new]];
    [section setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]];
    
    [self.manager addSection:section];
    
    for (int i = 0; i < 2; i++) {
        
        SiteModle *list = [SiteModle new];
        list.codeString = InfoCode;
        list.nameString = i == 0 ? @"组织者" : @"场地";
        list.addressString = i == 0 ? @"黄海波" : @"狮山羽毛球馆";
        list.juliString = i == 0 ? @"拨打" : @"导航";
        list.imgString = i == 0 ? @"dianhua.png" : @"导航.png";
        
        RETableViewSection *section2 = [RETableViewSection section];
        //        RETableViewSection *section = [RETableViewSection section];
        [self.manager addSection:section2];
        
        // Add item (image)
        //
        [section2 addItem:[SiteItem itemWithSiteModle:list]];
        if (i == 1) {
             [section2 setFooterView:[HDpeoleView new]];
//            [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10) ]
        }
       
        
    }
    
    RETableViewSection *section3 = [RETableViewSection sectionWithHeaderView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10)]];
    [self.manager addSection:section3];

    RETableViewItem *titleAndImageItem = [RETableViewItem itemWithTitle:@"狮山羽毛球协会" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
    }];
    titleAndImageItem.image = [UIImage imageNamed:@"球会.png"];
//    titleAndImageItem.highlightedImage = [UIImage imageNamed:@"球会.png"];
    [section3 addItem:titleAndImageItem];
    [section3 setFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainWidth, 10)]];

    
    [self addBotomView];
    // Do any additional setup after loading the view.
}

- (void)addBotomView {
    UIView *botomView = [UIView new];
    botomView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    botomView.frame = (CGRect){0 ,MainHeight - 80 - 64,MainWidth,80};
    [self.view addSubview:botomView];
    
    UIButton *manImage = [UIButton new];
    [manImage setFrame:(CGRect){15,25,MainWidth - 150,28}];
    manImage.backgroundColor = [UIColor clearColor];
    [manImage setImage:[UIImage imageNamed:@"勾选.png"] forState:UIControlStateNormal];
    [manImage setTitle:@"我已同意《免责条款》" forState:UIControlStateNormal];
    [manImage setTitleColor:[UIColor colorWithHexString:@"#4A90E2"] forState:UIControlStateNormal];
    [manImage setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [manImage addActionHandler:^(NSInteger tag) {
        
    }];
    [botomView addSubview:manImage];

    
//    TTTAttributedLabel *TTTlabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(50, 25 ,160, 30)];
//    TTTlabel.font = [UIFont systemFontOfSize:15];
//    TTTlabel.textColor = [UIColor colorWithHexString:@"#4A90E2"];
//    TTTlabel.lineBreakMode = NSLineBreakByCharWrapping;
//    TTTlabel.numberOfLines = 0;
//    //设置高亮颜色
//    TTTlabel.highlightedTextColor = [UIColor  colorWithHexString:@"#4A90E2"];
//    
//    //检测url
//    TTTlabel.enabledTextCheckingTypes = NSTextCheckingTypeLink;
//    
//    //对齐方式
//    TTTlabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
//    
//    //行间距
//    TTTlabel.lineSpacing = 2;
//    
//    //设置阴影
//    TTTlabel.shadowColor = [UIColor clearColor];
//    
//    TTTlabel.delegate = self; // Delegate
//    //NO 不显示下划线
//    TTTlabel.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(NSString *)kCTUnderlineStyleAttributeName];
//    
//    NSString *text =  @"我已同意《免责条款》";
//    [TTTlabel setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString)
//     {
//         
//         //设置可点击文字的范围
//         NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"《免责条款》" options:NSCaseInsensitiveSearch];
//         
//         //设定可点击文字的的大小
//         UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:15];
//         CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
//         
//         if (font) {
//             
//             //设置可点击文本的大小
//             [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
//             
//             //设置可点击文本的颜色
//             [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor  colorWithHexString:@"#4A90E2"] CGColor] range:boldRange];
//             
//             CFRelease(font);
//             
//         }
//         return mutableAttributedString;
//     }];
//
//    
//    [botomView addSubview:TTTlabel];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = [UIColor colorWithHexString:@"#D14946"];
    [sureBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [sureBtn setTitle:@"立即报名" forState:UIControlStateNormal];
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 4.0f;
    sureBtn.frame = (CGRect){MainWidth - 120 ,20,100,44};
    [sureBtn addActionHandler:^(NSInteger tag) {
    }];
    [botomView addSubview:sureBtn];
    
    //    [self.tableView setTableFooterView:botomView];
    
}


- (void)attributedLabel:(__unused TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url
{
    NSLog(@"!!!!!!%@",label.text);
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
