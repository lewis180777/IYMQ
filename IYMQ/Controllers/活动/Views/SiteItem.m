//
//  SiteItem.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "SiteItem.h"

@implementation SiteItem

+ (SiteItem *)itemWithSiteModle:(SiteModle *)site {
    
    SiteItem *item = [[SiteItem alloc] init];
    item.site = site;
    [item deselectRowAnimated:YES];
    
    return item;
}

@end
