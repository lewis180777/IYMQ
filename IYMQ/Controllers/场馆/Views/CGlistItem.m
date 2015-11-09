//
//  CGlistItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "CGlistItem.h"

@implementation CGlistItem

+ (CGlistItem *)itemWithCGlistModel:(CGlistModel *)SHlist {
    CGlistItem *item = [[CGlistItem alloc] init];
    item.HDlist = SHlist;
    [item deselectRowAnimated:YES];
    
    return item;
}

@end
