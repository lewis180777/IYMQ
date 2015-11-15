//
//  HDorCommanageViewController.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/11.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "MyRootTableViewController.h"

typedef NS_ENUM(NSInteger, typeManage) {
    HDTypeMan = 0,     	// 活动管理
    SSTypeMen = 1,       //申诉管理
};


@interface HDorCommanageViewController : MyRootTableViewController

@property (nonatomic,assign) typeManage type;

@end
