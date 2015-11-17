//
//  HDManagementCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "HDManagementItem.h"

@interface HDManagementCell : RETableViewCell

@property (strong, readwrite, nonatomic) UIImageView *pictureView;
//@property (strong, readwrite, nonatomic) UIImageView *picView;
@property (strong, readwrite, nonatomic) UIImageView *peopleView;
//@property (strong, readwrite, nonatomic) UIImageView *numView;

@property (strong, readwrite, nonatomic) HDManagementItem *item;  //必须是命名是item

@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *timeLabel;
@property (strong, readwrite, nonatomic) UILabel *codeLabel;
@property (strong, readwrite, nonatomic) UILabel *qiuhuiLabel;
//@property (strong, readwrite, nonatomic) UILabel *qiuguangLabel;
@property (strong, readwrite, nonatomic) UILabel *countLabel;
//@property (strong, readwrite, nonatomic) UILabel *manLabel;
@property (strong, readwrite, nonatomic) UILabel *juliLabel;

@property (strong, readwrite, nonatomic) UIButton *delectButton;
@property (strong, readwrite, nonatomic) UIButton *exitButton;
@property (strong, readwrite, nonatomic) UIButton *memberButton;

@end
