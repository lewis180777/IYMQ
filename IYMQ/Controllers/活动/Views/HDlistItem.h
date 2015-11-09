//
//  HDlistItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/5.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "HDlistModel.h"

@interface HDlistItem : RETableViewItem

@property (strong,nonatomic) HDlistModel *HDlist;  //模型必须是strong类型

+ (HDlistItem *)itemWithHDlistModel:(HDlistModel *)SHlist;

@end
