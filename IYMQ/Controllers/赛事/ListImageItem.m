//
//  ListImageItem.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 4/2/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "ListImageItem.h"

@implementation ListImageItem

+ (ListImageItem *)itemWithImageNamed:(SHlistModel *)SHlist
{
    ListImageItem *item = [[ListImageItem alloc] init];
    item.SHlist = SHlist;
    
    DLog(@"chuqihua %@",item.SHlist);
    
//    item.imgString = SHlist.imgString;
//    item.picString = SHlist.picString;
//     item.nameString = SHlist.nameString;
//     item.BMstring = SHlist.BMstring;
//     item.BSstring = SHlist.BSstring;
    [item deselectRowAnimated:YES];
    
    return item;
}

@end
