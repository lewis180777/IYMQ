//
//  SiteItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "SiteModle.h"

@interface SiteItem : RETableViewItem

@property (strong,nonatomic) SiteModle *site;  //模型必须是strong类型

+ (SiteItem *)itemWithSiteModle:(SiteModle *)site;


@end
