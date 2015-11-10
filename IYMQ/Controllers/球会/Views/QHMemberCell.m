//
//  QHMemberCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHMemberCell.h"

@implementation QHMemberCell

@synthesize item;  //必须是命名是item
@synthesize nameLabel;
@synthesize dextLabel;
@synthesize imgView;

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    
    return 70;
    
    
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    
    [self addSubview:self.imgView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.dextLabel];
    
    [self autoresizes];
    
    
}

- (UIImageView *)imgView {
    if (imgView == nil) {
        UIImageView *img = [UIImageView new];
        [img setBackgroundColor:[UIColor clearColor]];
        img.layer.masksToBounds = YES;
        img.layer.cornerRadius = 25.0f;
        imgView = img;
        
    }
    return imgView;
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
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        dextLabel = label;
        
    }
    return dextLabel;
}



- (void)cellWillAppear
{
    [super cellWillAppear];
    [imgView setImage:[UIImage imageNamed:item.QHmember.imgString]];
    nameLabel.text = item.QHmember.nameString;
    dextLabel.text = item.QHmember.dextString;
    
    
    
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(50, 50));  //设置大小
    }];

    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@70);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(MainWidth - 100, 30));  //设置大小
    }];
    
    
    
    [dextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@70);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(MainWidth - 100, 30));  //设置大小
    }];
    
    
}


@end
