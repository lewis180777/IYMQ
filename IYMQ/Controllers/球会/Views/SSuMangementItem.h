//
//  SSuMangementItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "SSuManagementModel.h"

@interface SSuMangementItem : RETableViewItem

@property (strong,nonatomic) SSuManagementModel *SSuManagement;  //模型必须是strong类型

+ (SSuMangementItem *)itemWithSSuManagementModel:(SSuManagementModel *)SSuManagement;

@end
