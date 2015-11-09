//
//  QHinfoItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/9.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "QHinfoModel.h"

@interface QHinfoItem : RETableViewItem

@property (strong,nonatomic) QHinfoModel *QHinfo;  //模型必须是strong类型

+ (QHinfoItem *)itemWithQHinfoModel:(QHinfoModel *)QHinfo;


@end
