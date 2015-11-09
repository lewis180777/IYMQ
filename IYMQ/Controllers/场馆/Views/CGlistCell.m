//
//  CGlistCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "CGlistCell.h"

@implementation CGlistCell

@synthesize item;  //必须是命名是item

@synthesize nameLabel;
@synthesize addressLabel;
@synthesize NumButton;
@synthesize DaoHbutton;
@synthesize juliLabel;
@synthesize Label;

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 111;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [self addSubview:self.NumButton];
    [self addSubview:self.DaoHbutton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.addressLabel];
    [self addSubview:self.juliLabel];
    [self addSubview:[self Label:73.0f]];
    [self addSubview:[self Label]];
    [self autoresizes];
    
    
}

- (UILabel *)Label:(float)getY {
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [label setFrame:(CGRect){0,getY,MainWidth,1}];
    
    return label;
}

- (UILabel *)Label {
    if (Label == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
        Label = label;
    }
    
    
    return Label;
}

- (UIButton *)NumButton {
    if (NumButton == nil) {
        NumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NumButton.backgroundColor = [UIColor clearColor];
        [NumButton.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
        [NumButton setTitleColor:[UIColor colorWithHexString:@"#D14946"] forState:UIControlStateNormal];
        [NumButton setImage:[UIImage imageNamed:@"dianhua.png"] forState:UIControlStateNormal];
        [NumButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [NumButton addActionHandler:^(NSInteger tag) {
            DLog(@"打电话");
        }];
        
    }
    return NumButton;
}

- (UIButton *)DaoHbutton {
    if (DaoHbutton == nil) {
        DaoHbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        DaoHbutton.backgroundColor = [UIColor clearColor];
        [DaoHbutton setImage:[UIImage imageNamed:@"daohang.png"] forState:UIControlStateNormal];
        [DaoHbutton setTitle:@"导航" forState:UIControlStateNormal];
        [DaoHbutton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [DaoHbutton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        [DaoHbutton addActionHandler:^(NSInteger tag) {
            DLog(@"导航");
        }];
        
    }
    return DaoHbutton;
}





- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        
        nameLabel = label;
        
    }
    return nameLabel;
}



- (UILabel *)juliLabel {
    if (juliLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        label.textAlignment = NSTextAlignmentRight;
        juliLabel = label;
        
    }
    return juliLabel;
}



- (UILabel *)addressLabel {
    if (addressLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        addressLabel = label;
        
    }
    return addressLabel;
}



- (void)cellWillAppear
{
    [super cellWillAppear];
    
    //    [pictureView setImage:[UIImage imageNamed:item.QHlist.imgString]];
    
    nameLabel.text = item.HDlist.nameString;
    addressLabel.text = item.HDlist.addressString;
    juliLabel.text = item.HDlist.juliString;
    [NumButton setTitle:item.HDlist.iponeNumString forState:UIControlStateNormal];

    
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    [NumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(5);
        make.bottom.mas_equalTo(@3);
        make.size.mas_equalTo(CGSizeMake(MainWidth/2 - 5, 44));  //设置大小
    }];
    
    [DaoHbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(MainWidth/2 + 5);
        make.bottom.mas_equalTo(@3);
        make.size.mas_equalTo(CGSizeMake(MainWidth/2 - 5, 44));  //设置大小
    }];
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@11.5);
        make.size.mas_equalTo(CGSizeMake(258, 30));  //设置大小
    }];
    
    
    
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@43);
        make.size.mas_equalTo(CGSizeMake(258, 25));  //设置大小
    }];
    
    [juliLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.top.mas_equalTo(@43);
        make.size.mas_equalTo(CGSizeMake(80, 25));  //设置大小
    }];
    
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(MainWidth/2));
        make.bottom.mas_equalTo(@-3);
        make.size.mas_equalTo(CGSizeMake(1, 27));  //设置大小
    }];
    
    
}

@end
