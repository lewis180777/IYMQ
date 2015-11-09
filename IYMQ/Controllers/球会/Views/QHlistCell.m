//
//  QHlistCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHlistCell.h"

@implementation QHlistCell

@synthesize pictureView;
@synthesize item;
@synthesize nameLabel;
@synthesize qiuguangLabel;
@synthesize juliLabel;

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 73.5;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [self addSubview:self.pictureView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.qiuguangLabel];
    [self addSubview:self.juliLabel];
    [self autoresizes];
    
    
}

- (UILabel *)Label:(float)getY {
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [label setFrame:(CGRect){0,getY,MainWidth,1}];
    
    return label;
}

- (UIImageView *)pictureView {
    if (pictureView == nil) {
        pictureView = [UIImageView new];
        pictureView.backgroundColor = [UIColor clearColor];
        [pictureView setImage:[UIImage imageNamed:@"默认头像.png"]];
        //        pictureView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    return pictureView;
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



- (UILabel *)qiuguangLabel {
    if (qiuguangLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        qiuguangLabel = label;
        
    }
    return qiuguangLabel;
}



- (void)cellWillAppear
{
    [super cellWillAppear];
    
//    [pictureView setImage:[UIImage imageNamed:item.QHlist.imgString]];

    nameLabel.text = item.QHlist.nameString;
    qiuguangLabel.text = item.QHlist.qiuguangString;
    juliLabel.text = item.QHlist.juliString;
    
  
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(50, 50));  //设置大小
    }];
    

    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@74);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@10.5);
        make.size.mas_equalTo(CGSizeMake(258, 30));  //设置大小
    }];
    
 
    
    [qiuguangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@74);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(258, 25));  //设置大小
    }];
    
    [juliLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-80);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(80, 25));  //设置大小
    }];
    
}



@end
