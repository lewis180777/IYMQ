//
//  SiteCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SiteCell.h"

@implementation SiteCell


@synthesize item;
@synthesize nameLabel;
@synthesize addressLabel;
@synthesize juliLabel;
@synthesize pictureView;


+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 68;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
   
    [self addSubview:self.nameLabel];
    [self addSubview:self.addressLabel];

//    if (item.site.codeString == SiteCode) {
//         [self addSubview:self.juliLabel];
//    }
//    else if (item.site.codeString == InfoCode) {
        [self addSubview:self.juliLabel];
        [self addSubview:self.pictureView];

   
//    }
    
   

    
   
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
        pictureView.hidden = YES;
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
    
    if (item.site.codeString == SiteCode) {
        nameLabel.text = item.site.nameString;
        
        juliLabel.text = item.site.juliString;
        
        addressLabel.text = item.site.addressString;

    }
    else if (item.site.codeString == InfoCode) {
        pictureView.hidden = NO;
        [pictureView setImage:[UIImage imageNamed:item.site.imgString]];
        
        nameLabel.font = [UIFont systemFontOfSize:15.0f];
        nameLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        nameLabel.text = item.site.nameString;
        
        juliLabel.textColor = [UIColor colorWithHexString:@"#D14946"];
        juliLabel.text = item.site.juliString;
        
        addressLabel.font = [UIFont systemFontOfSize:17.0f];
        addressLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        addressLabel.text = item.site.addressString;
        
    }
    
   
    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {

//    if (pictureView != nil) {
        [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.bottom.mas_equalTo(@-30);
            make.size.mas_equalTo(CGSizeMake(15, 15));  //设置大小
        }];
//    }
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(258, 30));  //设置大小
    }];
    
    
    [juliLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(80, 25));  //设置大小
    }];
    
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(258, 25));  //设置大小
    }];
}


@end
