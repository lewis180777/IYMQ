//
//  NewOrOldMemberViewController.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/11.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "MyRootTableViewController.h"

typedef NS_ENUM(NSInteger, typeCode) {
    newCode = 0,     	// 新加入
    oldCode = 1,       //老会员
};


@interface NewOrOldMemberViewController : MyRootTableViewController

@property (assign,nonatomic) typeCode type;

@end
