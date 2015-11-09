//
//  QHinfoItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/9.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "QHinfoItem.h"

@implementation QHinfoItem

+ (QHinfoItem *)itemWithQHinfoModel:(QHinfoModel *)QHinfo {
    QHinfoItem *item = [[QHinfoItem alloc] init];
    item.QHinfo = QHinfo;
    [item deselectRowAnimated:YES];
    item.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    return item;
}

@end
