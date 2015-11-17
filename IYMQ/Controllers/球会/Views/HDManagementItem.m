//
//  HDManagementItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/16.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDManagementItem.h"

@implementation HDManagementItem

+ (HDManagementItem *)itemWithHDManagementModel:(HDManagementModel *)HDManagement {
    HDManagementItem *item = [[HDManagementItem alloc] init];
    item.HDManagement = HDManagement;
    [item deselectRowAnimated:YES];
    item.selectionStyle = UITableViewCellSeparatorStyleNone;
    return item;
}

@end
