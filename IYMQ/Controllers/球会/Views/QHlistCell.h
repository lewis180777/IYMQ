//
//  QHlistCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHlistItem.h"

@interface QHlistCell : RETableViewCell

@property (strong, readwrite, nonatomic) UIImageView *pictureView;
@property (strong, readwrite, nonatomic) QHlistItem *item;  //必须是命名是item
@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *qiuguangLabel;
@property (strong, readwrite, nonatomic) UILabel *juliLabel;

@end
