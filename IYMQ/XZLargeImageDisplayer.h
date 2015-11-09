//
//  XZLargeImageMonito.h
//  Chat
//
//  Created by iXcoder on 15/4/29.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 *  图片查看器
 */


/*用法

//图片查看器
NSArray *arrayImage = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=2ac39196718b4710ce2ffdc4f3cfc3b2/38e2e28fa0ec08fac15f7a105aee3d6d54fbda08.jpg",@"http://img4q.duitang.com/uploads/item/201502/09/20150209000105_8rNkQ.jpeg",@"http://img4q.duitang.com/uploads/item/201502/08/20150208235838_4MPWW.jpeg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=c3e94d4152da81cb4ee683c56267d0a4/bdef7ff3d7ca7bcb64c1629abd096b63f724a82b.jpg"];
NSArray *arrayViews = @[[[UIView alloc]init],[[UIView alloc]init],[[UIView alloc]init],[[UIView alloc]init]];
XZLargeImageDisplayer *displayer = [[XZLargeImageDisplayer alloc] init];
[displayer showDisplayerWithPaths:arrayImage originViews:arrayViews defaultIndex:0 tapDismiss:YES];
*/

@interface XZLargeImageDisplayer : UIView

- (void)showDisplayerWithPaths:(NSArray *)paths originViews:(NSArray *)views defaultIndex:(NSUInteger)idx tapDismiss:(BOOL)tapDismiss;

@end
