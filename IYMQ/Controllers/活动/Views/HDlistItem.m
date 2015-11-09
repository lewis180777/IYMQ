//
//  HDlistItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/5.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDlistItem.h"

@implementation HDlistItem

+ (HDlistItem *)itemWithHDlistModel:(HDlistModel *)SHlist {
    HDlistItem *item = [[HDlistItem alloc] init];
    item.HDlist = SHlist;
    [item deselectRowAnimated:YES];
    
    return item;

}

@end
