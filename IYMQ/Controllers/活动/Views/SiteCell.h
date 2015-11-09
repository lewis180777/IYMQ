//
//  SiteCell.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "SiteItem.h"

@interface SiteCell : RETableViewCell

@property (strong, readwrite, nonatomic) SiteItem *item;  //必须是命名是item

@property (strong, readwrite, nonatomic) UIImageView *pictureView;

@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *addressLabel;
@property (strong, readwrite, nonatomic) UILabel *juliLabel;

@end
