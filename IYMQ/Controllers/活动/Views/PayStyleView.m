//
//  PayStyleView.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "PayStyleView.h"

@implementation PayStyleView

-(instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        self.frame = (CGRect){0 ,0,MainWidth,106};
        [self initWithView];
    }
    return self;
}

- (void)initWithView {
//    UIImageView *manImage = [UIImageView new];
//    manImage.backgroundColor = [UIColor clearColor];
//    manImage.image = [UIImage imageNamed:@""];
//    [manImage setFrame:(CGRect){16,21,15,15}];
//    [self addSubview:manImage];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor clearColor];
    button1.frame = (CGRect){0 ,10,MainWidth,44};
    [button1 setTitle:@"余额 （优先使用打球券）" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"单选按钮.png"] forState:UIControlStateNormal];
    [button1 setImageEdgeInsets:UIEdgeInsetsMake(0, -107, 0, 0)];
    [button1 addActionHandler:^(NSInteger tag) {
        
    }];
    [self addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor clearColor];
    button2.frame = (CGRect){0 ,55,MainWidth,44};
    [button2 setTitle:@"支付宝 （支付宝用户使用）" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"单选按钮1.png"] forState:UIControlStateNormal];
    [button2 setImageEdgeInsets:UIEdgeInsetsMake(0, -90, 0, 0)];
    [button2 addActionHandler:^(NSInteger tag) {
        
    }];
    [self addSubview:button2];


    
//    UILabel *manLabel = [UILabel initLabelText:@"余额 （优先使用打球券）" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
//    [manLabel setFrame:(CGRect){50,21,MainWidth-80,30}];
//    [self addSubview:manLabel];
}

@end
