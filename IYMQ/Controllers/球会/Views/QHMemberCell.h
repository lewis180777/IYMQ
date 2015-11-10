//
//  QHMemberCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHMembetItem.h"

@interface QHMemberCell : RETableViewCell

@property (strong, readwrite, nonatomic) QHMembetItem *item;  //必须是命名是item
@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *dextLabel;
@property (strong, readwrite, nonatomic) UIImageView *imgView;

@end
