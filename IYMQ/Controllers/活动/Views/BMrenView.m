//
//  BMrenView.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "BMrenView.h"

@implementation BMrenView

-(instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        self.frame = (CGRect){0 ,0,MainWidth,130};
        [self initWithView];
    }
    return self;
}

- (void)initWithView {
    UIImageView *manImage = [UIImageView new];
    manImage.backgroundColor = [UIColor clearColor];
    manImage.image = [UIImage imageNamed:@"男.png"];
    [manImage setFrame:(CGRect){16,27,15,15}];
    [self addSubview:manImage];
    
    UILabel *manLabel = [UILabel initLabelText:@"男：￥15/人" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    [manLabel setFrame:(CGRect){42,21,105,30}];
    [self addSubview:manLabel];
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor clearColor];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 3.0f;
    view1.layer.borderWidth = 1.0f;
    view1.layer.borderColor = [[UIColor colorWithHexString:@"#666666"] CGColor];
    view1.frame = (CGRect){210,12,135,44};
    [self addSubview:view1];
    
    UILabel *label1 = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#666666"] textColor:[UIColor clearColor]];
     label1.frame = (CGRect){45,0,1,44};
    [view1 addSubview:label1];
    
    UILabel *label2 = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#666666"] textColor:[UIColor clearColor]];
    label2.frame = (CGRect){45 * 2 ,0,1,44};
    [view1 addSubview:label2];
    
    UILabel *numManLabel = [UILabel initLabelText:@"2" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#666666"]];
    numManLabel.textAlignment = NSTextAlignmentCenter;
    numManLabel.frame = (CGRect){46,0,44,44};
    [view1 addSubview:numManLabel];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = (CGRect){0 ,0,44,44};
    [button1 setTitle:@"-" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [button1 addActionHandler:^(NSInteger tag) {
        
    }];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = (CGRect){44*2 ,0,44,44};
    [button2 setTitle:@"+" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [button2 addActionHandler:^(NSInteger tag) {
        
    }];
    [view1 addSubview:button1];
    [view1 addSubview:button2];
    
    
    
    UIImageView *menImage = [UIImageView new];
    menImage.backgroundColor = [UIColor clearColor];
    menImage.image = [UIImage imageNamed:@"女.png"];
    [menImage setFrame:(CGRect){16,88,15,15}];
    [self addSubview:menImage];
    
    UILabel *menLabel = [UILabel initLabelText:@"女：￥10/人" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    [menLabel setFrame:(CGRect){42,82,105,30}];
    [self addSubview:menLabel];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor clearColor];
    view2.layer.masksToBounds = YES;
    view2.layer.cornerRadius = 3.0f;
    view2.layer.borderWidth = 1.0f;
    view2.layer.borderColor = [[UIColor colorWithHexString:@"#666666"] CGColor];
    view2.frame = (CGRect){210,75,135,44};
    [self addSubview:view2];
    
    UILabel *label3 = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#666666"] textColor:[UIColor clearColor]];
    label3.frame = (CGRect){45,0,1,44};
    [view2 addSubview:label3];
    
    UILabel *label4 = [UILabel initLabelText:@"" sizeFont:15.0f backgroundColor:[UIColor colorWithHexString:@"#666666"] textColor:[UIColor clearColor]];
    label4.frame = (CGRect){45 * 2 ,0,1,44};
    [view2 addSubview:label4];
    
    UILabel *numMenLabel = [UILabel initLabelText:@"2" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#666666"]];
    numMenLabel.textAlignment = NSTextAlignmentCenter;
    numMenLabel.frame = (CGRect){46,0,44,44};
    [view2 addSubview:numMenLabel];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = (CGRect){0 ,0,44,44};
    [button3 setTitle:@"-" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [button3 addActionHandler:^(NSInteger tag) {
        
    }];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = (CGRect){44*2 ,0,44,44};
    [button4 setTitle:@"+" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [button4 addActionHandler:^(NSInteger tag) {
        
    }];
    [view2 addSubview:button3];
    [view2 addSubview:button4];
    
    
}

@end
