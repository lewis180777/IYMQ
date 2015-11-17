//
//  SSuMangementItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SSuMangementItem.h"

@implementation SSuMangementItem

+ (SSuMangementItem *)itemWithSSuManagementModel:(SSuManagementModel *)SSuManagement {
    SSuMangementItem *item = [[SSuMangementItem alloc] init];
    item.SSuManagement = SSuManagement;
    [item deselectRowAnimated:YES];
    item.selectionStyle = UITableViewCellSeparatorStyleNone;
    return item;
}

@end
