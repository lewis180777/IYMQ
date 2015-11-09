//
//  CGlistItem.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/6.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CGlistModel.h"

@interface CGlistItem : RETableViewItem

@property (strong,nonatomic) CGlistModel *HDlist;  //模型必须是strong类型

+ (CGlistItem *)itemWithCGlistModel:(CGlistModel *)SHlist;

@end
