//
//  ListImageCell.h
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 4/2/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "ListImageItem.h"

@interface ListImageCell : RETableViewCell

@property (strong, readwrite, nonatomic) UIImageView *pictureView;
@property (strong, readwrite, nonatomic) UIImageView *picView;  //比赛中的图片
@property (strong, readwrite, nonatomic) ListImageItem *item;
@property (strong, readwrite, nonatomic) UILabel *nameLabel;
@property (strong, readwrite, nonatomic) UILabel *BMtimeLabel;
@property (strong, readwrite, nonatomic) UILabel *BStimeLabel;


@end
