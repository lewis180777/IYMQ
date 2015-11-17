//
//  SSuMangementCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "SSuMangementItem.h"

@interface SSuMangementCell : RETableViewCell

@property (strong, readwrite, nonatomic) UIButton *exitButton;    // 拒绝
@property (strong, readwrite, nonatomic) UIButton *memberButton; //同意

@property (strong, readwrite, nonatomic) SSuMangementItem *item;  //必须是命名是item

@property (strong, readwrite, nonatomic) UILabel *nameLabel;  //内容

@end
