//
//  SSuMangementCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SSuMangementCell.h"

@implementation SSuMangementCell


@synthesize exitButton;    // 拒绝
@synthesize memberButton; //同意

@synthesize item;  //必须是命名是item

@synthesize nameLabel;  //内容

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    SSuMangementItem *Iten = (SSuMangementItem *)item;
    
    CGSize titleSize = [Iten.SSuManagement.textString boundingRectWithSize:CGSizeMake(MainWidth - 80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size;
    return titleSize.height + 40 + 35;

}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];

    [self addSubview:self.nameLabel];
    [self addSubview:self.exitButton];
    [self addSubview:self.memberButton];
    
    [self autoresizes];
    
    
}



- (UIButton *)exitButton {
    if (exitButton == nil) {
        UIButton *button = [UIButton bundleWithTitle:@"拒绝" BGColor:[UIColor colorWithHexString:@"#FFFFFF"] titleColor:[UIColor colorWithHexString:@"#333333"] textHighligtedColor:nil];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4.0f;
        button.layer.borderWidth = 1.0f;
        button.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        exitButton = button;
        
    }
    return exitButton;
}

- (UIButton *)memberButton {  //同意与已拒绝
    if (memberButton == nil) {
        UIButton *button = [UIButton bundleWithTitle:@"同意" BGColor:[UIColor colorWithHexString:@"#D14946"] titleColor:[UIColor colorWithHexString:@"#FFFFFF"] textHighligtedColor:nil];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4.0f;
//        button.layer.borderWidth = 1.0f;
//        button.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        memberButton = button;
        
    }
    return memberButton;
}





- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByCharWrapping;
        
        nameLabel = label;
        
    }
    return nameLabel;
}



- (void)cellWillAppear
{
    [super cellWillAppear];

    CGSize titleSize = [item.SSuManagement.textString boundingRectWithSize:CGSizeMake(MainWidth - 80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size;
    [nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(titleSize.width, titleSize.height));  //设置大小
        
    }];
    nameLabel.text = item.SSuManagement.textString;
    
    
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {

    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(MainWidth - 80, 30));  //设置大小
    }];
    
    [exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@80);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(60, 35));  //设置大小
    }];
    
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(60, 35));  //设置大小
    }];
    
}


@end
