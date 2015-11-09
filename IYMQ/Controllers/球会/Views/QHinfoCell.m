//
//  QHinfoCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/9.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHinfoCell.h"

@implementation QHinfoCell


@synthesize item;
@synthesize nameLabel;
@synthesize dextLabel;


+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    QHinfoItem *Iten = (QHinfoItem *)item;
    
    CGSize titleSize = [Iten.QHinfo.nameString boundingRectWithSize:CGSizeMake(MainWidth - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil].size;
    if (titleSize.height < 45) {
        return 45.0f;
    }
    
    return titleSize.height + 10;
    
    
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];

    [self addSubview:self.nameLabel];
    [self addSubview:self.dextLabel];

    [self autoresizes];
    
    
}

- (UILabel *)Label:(float)getY {
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [label setFrame:(CGRect){0,getY,MainWidth,1}];
    
    return label;
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






- (UILabel *)dextLabel {
    if (dextLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        dextLabel = label;
        
    }
    return dextLabel;
}



- (void)cellWillAppear
{
    [super cellWillAppear];
    
   CGSize titleSize = [item.QHinfo.nameString boundingRectWithSize:CGSizeMake(MainWidth - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    if(titleSize.height > 30){
        [nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@5);
            make.size.mas_equalTo(titleSize);  //设置大小
        }];
    }
    nameLabel.text = item.QHinfo.nameString;
    dextLabel.text = item.QHinfo.dextString;

    
    
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@80);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@7);
        make.size.mas_equalTo(CGSizeMake(MainWidth - 100, 30));  //设置大小
    }];
    
    
    
    [dextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(65, 25));  //设置大小
    }];
    
    
}

@end
