//
//  CYLSearchBar.m
//  CYLSearchViewController
//
//  Created by   http://weibo.com/luohanchenyilong/  on 15/5/29.
//  Copyright (c) 2015年  https://github.com/ChenYilong/CYLSearchViewController . All rights reserved.
//

#import "CYLSearchBar.h"

@implementation CYLSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (id)sharedInit {
    self.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    self.placeholder = @"搜索";
    self.keyboardType = UIKeyboardTypeDefault;
    
    if(IOS_VERSION < 7.1 && IOS_VERSION >= 7.0) {
        
    }
    else {
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = NO; //这里设置YES为无文字就灰色不可点
    }
    
    
    
    self.showsCancelButton = NO;
    // 删除UISearchBar中的UISearchBarBackground
//    [self setBackgroundImage:[[UIImage alloc] init]];
    self.tintColor = APP_TINT_COLOR;
    
    [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self sizeToFit];
    self.backgroundImage = [self imageWithColor:[UIColor colorWithHexString:@"#F0F0F0"] size:self.bounds.size];
//    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
    return self;
}

//取消searchbar背景色
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
