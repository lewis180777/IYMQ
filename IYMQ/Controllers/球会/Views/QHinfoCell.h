//
//  QHinfoCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/9.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHinfoItem.h"

@interface QHinfoCell : RETableViewCell

@property (strong, readwrite, nonatomic) QHinfoItem *item;  //必须是命名是item
@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *dextLabel;

@end
