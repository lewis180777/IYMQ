//
//  CGlistCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CGlistItem.h"

@interface CGlistCell : RETableViewCell

@property (strong, readwrite, nonatomic) CGlistItem *item;  //必须是命名是item
@property (strong, readwrite, nonatomic) UILabel *Label;
@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *addressLabel;
@property (strong, readwrite, nonatomic) UIButton *NumButton;
@property (strong, readwrite, nonatomic) UIButton *DaoHbutton;
@property (strong, readwrite, nonatomic) UILabel *juliLabel;

@end
