//
//  HDManagementCell.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDManagementCell.h"

@implementation HDManagementCell

@synthesize pictureView;
//@synthesize picView;
@synthesize peopleView;
@synthesize delectButton;
@synthesize item;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize codeLabel;
@synthesize qiuhuiLabel;
@synthesize exitButton;
@synthesize countLabel;
@synthesize memberButton;
@synthesize juliLabel;

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return 161;
}

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    [self addSubview:self.pictureView];
    [self addSubview:self.peopleView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.countLabel];
    [self addSubview:self.qiuhuiLabel];
    [self addSubview:self.codeLabel];
    [self addSubview:self.juliLabel];
    
    [self addSubview:self.delectButton];
    [self addSubview:self.exitButton];
    [self addSubview:self.memberButton];
    

    [self addSubview:[self Label:39.0f]];
    [self addSubview:[self Label:113.0f]];
    [self autoresizes];
    
    
}

- (UIButton *)delectButton {
    if (delectButton == nil) {
        UIButton *button = [UIButton bundleButton:@""];
        [button setTitle:@"删除" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        delectButton = button;
        
    }
    return delectButton;
}

- (UIButton *)exitButton {
    if (exitButton == nil) {
        UIButton *button = [UIButton bundleWithTitle:@"修改" BGColor:[UIColor colorWithHexString:@"#FFFFFF"] titleColor:[UIColor colorWithHexString:@"#666666"] textHighligtedColor:nil];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4.0f;
        button.layer.borderWidth = 1.0f;
        button.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        exitButton = button;
        
    }
    return exitButton;
}

- (UIButton *)memberButton {
    if (memberButton == nil) {
        UIButton *button = [UIButton bundleWithTitle:@"报名人员" BGColor:[UIColor colorWithHexString:@"#FFFFFF"] titleColor:[UIColor colorWithHexString:@"#666666"] textHighligtedColor:nil];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4.0f;
        button.layer.borderWidth = 1.0f;
        button.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        memberButton = button;
        
    }
    return memberButton;
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

//- (UIImageView *)picView {
//    if (picView == nil) {
//        picView = [UIImageView new];
//        picView.backgroundColor = [UIColor clearColor];
//        [picView setImage:[UIImage imageNamed:@"位置.png"]];
//        //        picView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    }
//    return picView;
//    
//    
//}

- (UIImageView *)peopleView {
    if (peopleView == nil) {
        peopleView = [UIImageView new];
        peopleView.backgroundColor = [UIColor clearColor];
        [peopleView setImage:[UIImage imageNamed:@"人数.png"]];
        
        //        picView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    return peopleView;
    
    
}

//- (UIImageView *)numView {
//    if (numView == nil) {
//        numView = [UIImageView new];
//        numView.backgroundColor = [UIColor clearColor];
//        [numView setImage:[UIImage imageNamed:@"dianhua.png"]];
//        //        picView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    }
//    return numView;
//    
//    
//}

- (UILabel *)nameLabel {
    if (nameLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        
        nameLabel = label;
        
    }
    return nameLabel;
}

- (UILabel *)timeLabel {
    if (timeLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#D14946"]];
        
        timeLabel = label;
        
    }
    return timeLabel;
}

- (UILabel *)codeLabel {
    if (codeLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
        
        codeLabel = label;
        
    }
    return codeLabel;
}

- (UILabel *)juliLabel {
    if (juliLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        label.textAlignment = NSTextAlignmentRight;
        juliLabel = label;
        
    }
    return juliLabel;
}

- (UILabel *)qiuhuiLabel {
    if (qiuhuiLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        qiuhuiLabel = label;
        
    }
    return qiuhuiLabel;
}

//- (UILabel *)qiuguangLabel {
//    if (qiuguangLabel == nil) {
//        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
//        
//        qiuguangLabel = label;
//        
//    }
//    return qiuguangLabel;
//}

- (UILabel *)countLabel {
    if (countLabel == nil) {
        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
        
        countLabel = label;
        
    }
    return countLabel;
}

//- (UILabel *)manLabel {
//    if (manLabel == nil) {
//        UILabel *label = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#D14946"]];
//        
//        manLabel = label;
//        
//    }
//    return manLabel;
//}

- (void)cellWillAppear
{
    [super cellWillAppear];
    //    [pictureView setImage:[UIImage imageNamed:Listitem.HDlist.imgString]];
    //
    //    DLog(@"!!!!!!!!  %@ ",item.HDlist.nameString);
    
    nameLabel.text = item.HDManagement.nameString;
    timeLabel.text = item.HDManagement.timeString;
    codeLabel.text = item.HDManagement.codeString;
    qiuhuiLabel.text = item.HDManagement.qiuhuiString;
    juliLabel.text = item.HDManagement.juliString;
    countLabel.text = item.HDManagement.countString;

    
}

- (void)cellDidDisappear
{
    [super cellDidDisappear];
}

- (void)autoresizes {
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        make.bottom.mas_equalTo(@-49.1);
        make.size.mas_equalTo(CGSizeMake(50, 50));  //设置大小
    }];
    
    [peopleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(10);
        //        make.centerX.equalTo(self.mas_centerY).width.offset(-10);
        make.bottom.mas_equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(11, 12));  //设置大小
    }];
    
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(peopleView.mas_left).with.offset(15);
        //        make.top.mas_equalTo(@180);
        make.bottom.mas_equalTo(@-4);
        make.size.mas_equalTo(CGSizeMake(80, 25));  //设置大小
    }];

    
   
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@74);
        //        make.right.mas_equalTo(@-42);
        make.top.mas_equalTo(@50.5);
        make.size.mas_equalTo(CGSizeMake(258, 30));  //设置大小
    }];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@8);
        make.size.mas_equalTo(CGSizeMake(200, 25));  //设置大小
    }];
    
    [codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-20);
        make.top.mas_equalTo(@5);
        //        make.bottom.mas_equalTo(@-16.6);
        make.size.mas_equalTo(CGSizeMake(83, 25));  //设置大小
    }];
    
    [qiuhuiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@74);
        make.top.mas_equalTo(@82);
        make.size.mas_equalTo(CGSizeMake(258, 25));  //设置大小
    }];
    

    [juliLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(@-53);
        make.size.mas_equalTo(CGSizeMake(80, 25));  //设置大小
    }];
    
    [delectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@10);
        make.right.mas_equalTo(@-15);
        make.size.mas_equalTo(CGSizeMake(20, 20));  //设置大小
    }];
    
    [exitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-100);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(60, 33));  //设置大小
    }];
    
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(80, 33));  //设置大小
    }];

    
    

}

@end
