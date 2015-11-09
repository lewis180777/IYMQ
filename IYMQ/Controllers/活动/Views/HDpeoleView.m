//
//  HDpeoleView.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "HDpeoleView.h"

@implementation HDpeoleView

-(instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        self.frame = (CGRect){0 ,0,MainWidth,80};
        [self initWithView];
    }
    return self;
}

- (void)initWithView {
    
    UILabel *Label = [UILabel initLabelText:@"报名人员" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#999999"]];
//    Label.numberOfLines = 0;
//    Label.lineBreakMode = NSLineBreakByCharWrapping;
    [Label setFrame:(CGRect){10,5,MainWidth-60,30}];
    [self addSubview:Label];
    
    [self Label:0];
    
    for (int i = 0; i < 7; i++) {
        
        UIImageView *manImage = [UIImageView new];
        [manImage setFrame:(CGRect){10 + 40 * i,35,30,30}];
        manImage.backgroundColor = [UIColor clearColor];
        manImage.image = [UIImage imageNamed:@"球会.png"];
        manImage.layer.masksToBounds = YES;
        manImage.layer.cornerRadius = 15.0;//（该值为长度的一半，就为圆形了。）
        [self addSubview:manImage];

    }
    
    
    
}

- (void)Label:(float)getY {
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [label setFrame:(CGRect){0,getY,MainWidth,1}];
    
    [self addSubview:label];
}


@end
