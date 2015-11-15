//
//  UITextView+PlaceHolder.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UITextView (PlaceHolder) <UITextViewDelegate>
@property (nonatomic, strong) UITextView *placeHolderTextView;
/** 注意先设置textView的字体 */
@property (nonatomic,copy) NSString *placeholder;
//@property (nonatomic, assign) id <UITextViewDelegate> textViewDelegate;
- (void)addPlaceHolder:(NSString *)placeHolder;
@end
