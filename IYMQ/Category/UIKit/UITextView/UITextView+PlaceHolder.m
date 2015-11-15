//
//  UITextView+PlaceHolder.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UITextView+PlaceHolder.h"

#define LEFT_MARGIN 5
#define TOP_MARGIN  8

static const char *phTextView = "placeHolderTextView";
@implementation UITextView (PlaceHolder)
- (UITextView *)placeHolderTextView {
    return objc_getAssociatedObject(self, phTextView);
}
- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, phTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)addPlaceHolder:(NSString *)placeHolder {
    if (![self placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
    }
}
# pragma mark -
# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.placeHolderTextView.hidden = YES;
    // if (self.textViewDelegate) {
    //
    // }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.placeHolderTextView.hidden = NO;
    }
}


- (NSString *)placeholder{
    return self.label.text;
}

- (void)setPlaceholder:(NSString *)placeholder{
    
    //赋值修改高度
    self.label.text = placeholder;
    [self changeLabelFrame];
    
    //监听文本改变,如果没有设置placeholder就不会监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

//文本修改
- (void)textDidChange:(NSNotification *)notify{
    self.label.hidden = self.text.length;
}

- (UILabel *)label{
    
    UILabel *label =  objc_getAssociatedObject(self, @"label");
    
    if (label == nil) {
        //没有就创建,并设置属性
        label = [[UILabel alloc] init];
        label.font = self.font;
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        
        [self addSubview:label];
        
        //关联到自身
        objc_setAssociatedObject(self, @"label", label, OBJC_ASSOCIATION_RETAIN);
        
    }
    
    return label;
}

//计算frame
- (void)changeLabelFrame{
    //文字可显示区域
    CGSize size = CGSizeMake(self.bounds.size.width - 2*LEFT_MARGIN, CGFLOAT_MAX);
    //计算文字所占区域
    CGSize labelSize = [self.placeholder boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.label.font} context:nil].size;
    
    self.label.frame = CGRectMake(LEFT_MARGIN, TOP_MARGIN, labelSize.width, labelSize.height);
}

@end
