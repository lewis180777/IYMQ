//
//  SiteModle.h
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CodeString) {
    SiteCode = 0,     	// 选择地点
    InfoCode = 1,            //活动详情
};


@interface SiteModle : NSObject

@property (nonatomic) CodeString codeString;  //判断哪种类型

@property (nonatomic,copy) NSString *imgString;
@property (nonatomic,copy) NSString *nameString;
@property (nonatomic,copy) NSString *addressString;
@property (nonatomic,copy) NSString *juliString;

@end
