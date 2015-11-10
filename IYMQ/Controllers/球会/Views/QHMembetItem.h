//
//  QHMembetItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/10.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHMemModel.h"

@interface QHMembetItem : RETableViewItem

@property (strong,nonatomic) QHMemModel *QHmember;  //模型必须是strong类型

+ (QHMembetItem *)itemWithQHMemModel:(QHMemModel *)QHmember;

@end
