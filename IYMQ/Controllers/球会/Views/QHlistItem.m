//
//  QHlistItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHlistItem.h"

@implementation QHlistItem


+ (QHlistItem *)itemWithQHlistModel:(QHlistModle *)QHlist {
    QHlistItem *item = [[QHlistItem alloc] init];
    item.QHlist = QHlist;
    [item deselectRowAnimated:YES];
    item.selectionStyle = UITableViewCellSeparatorStyleNone;
    item.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return item;
}

@end
