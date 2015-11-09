//
//  QHlistItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHlistModle.h"

@interface QHlistItem : RETableViewItem

@property (strong,nonatomic) QHlistModle *QHlist;  //模型必须是strong类型

+ (QHlistItem *)itemWithQHlistModel:(QHlistModle *)QHlist;

@end
