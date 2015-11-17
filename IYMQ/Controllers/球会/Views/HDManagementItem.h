//
//  HDManagementItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "HDManagementModel.h"

@interface HDManagementItem : RETableViewItem

@property (strong,nonatomic) HDManagementModel *HDManagement;  //模型必须是strong类型

+ (HDManagementItem *)itemWithHDManagementModel:(HDManagementModel *)HDManagement;

@end
