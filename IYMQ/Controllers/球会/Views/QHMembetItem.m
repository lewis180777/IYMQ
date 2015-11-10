//
//  QHMembetItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHMembetItem.h"

@implementation QHMembetItem

+ (QHMembetItem *)itemWithQHMemModel:(QHMemModel *)QHmember {
    QHMembetItem *item = [[QHMembetItem alloc] init];
    item.QHmember = QHmember;
    [item deselectRowAnimated:YES];
    item.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return item;
}

@end
