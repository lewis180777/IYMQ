//
//  ListImageItem.h
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 4/2/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RETableViewItem.h"
#import "SHlistModel.h"

@interface ListImageItem : RETableViewItem

@property (strong,nonatomic) SHlistModel *SHlist;  //模型必须是strong类型

//@property (nonatomic,copy) NSString *imgString;
//@property (nonatomic,copy) NSString *picString;
//@property (nonatomic,copy) NSString *nameString;
//@property (nonatomic,copy) NSString *BMstring;
//@property (nonatomic,copy) NSString *BSstring;

+ (ListImageItem *)itemWithImageNamed:(SHlistModel *)SHlist;

@end
