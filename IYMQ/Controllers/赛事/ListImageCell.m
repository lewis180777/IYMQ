//
//  ListImageCell.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 4/2/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "ListImageCell.h"

@interface ListImageCell ()



@end

@implementation ListImageCell

@synthesize item;
@synthesize pictureView;
@synthesize picView;
@synthesize nameLabel;
@synthesize BMtimeLabel;
@synthesize BStimeLabel;

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 100;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [self addSubview:self.pictureView];
    [self addSubview:self.picView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.BStimeLabel];
    [self addSubview:self.BMtimeLabel];
    [self autoresizes];
}

- (UIImageView *)pictureView {
    if (pictureView == nil) {
        pictureView = [UIImageView new];
        pictureView.backgroundColor = [UIColor clearColor];
//        pictureView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    return pictureView;
}

- (UIImageView *)picView {
    if (picView == nil) {
        picView = [UIImageView new];
        picView.backgroundColor = [UIColor clearColor];
//        picView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    return picView;
    

}

- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        
        nameLabel = label;
        
    }
    return nameLabel;
}

- (UILabel *)BMtimeLabel {
    if (BMtimeLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:13.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        BMtimeLabel = label;
        
    }
    return BMtimeLabel;
}

- (UILabel *)BStimeLabel {
    if (BStimeLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:13.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        BStimeLabel = label;
        
    }
    return BStimeLabel;
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [pictureView setImage:[UIImage imageNamed:item.SHlist.imgString]];
    [picView setImage:[UIImage imageNamed:item.SHlist.picString]];
    nameLabel.text = item.SHlist.nameString;
    BMtimeLabel.text = item.SHlist.BMstring;

    
    BStimeLabel.text = item.SHlist.BSstring;
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.bottom.mas_equalTo(@-16.6);
        make.size.mas_equalTo(CGSizeMake(83.3, 66.6));  //设置大小
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@109);
//        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@10.6);
        make.size.mas_equalTo(CGSizeMake(208, 30));  //设置大小
    }];
    
    [BMtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@109);
        make.top.mas_equalTo(@45);
        make.size.mas_equalTo(CGSizeMake(164, 25));  //设置大小
    }];
    [BStimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@109);
        make.top.mas_equalTo(@75);
        make.bottom.mas_equalTo(@-16.6);
        make.size.mas_equalTo(CGSizeMake(164, 25));  //设置大小
    }];

    
    [picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(@-16.6);
        make.size.mas_equalTo(CGSizeMake(46.6, 20));  //设置大小
    }];
}

@end
