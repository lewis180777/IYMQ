//
//  InfoHearView.m
//  IYMQ
//
//  Created by 陈亦海 on 15/11/8.
//  Copyright © 2015年 陈亦海. All rights reserved.
//

#import "InfoHearView.h"

@implementation InfoHearView

-(instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        self.frame = (CGRect){0 ,0,MainWidth,116};
        [self initWithView];
    }
    return self;
}

- (void)initWithView {
    
    UILabel *Label = [UILabel initLabelText:@"狮山羽毛球馆打球活动狮山羽毛球 馆打球活动狮山羽毛球馆打球活动狮山羽毛球 馆打球活动" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#333333"]];
    Label.numberOfLines = 0;
    Label.lineBreakMode = NSLineBreakByCharWrapping;
    [Label setFrame:(CGRect){10,5,MainWidth-60,80}];
    [self addSubview:Label];
    
    [self Label:77];
    
    UIImageView *manImage = [UIImageView new];
    manImage.backgroundColor = [UIColor clearColor];
    manImage.image = [UIImage imageNamed:@"时间.png"];
    [manImage setFrame:(CGRect){10,90,15,15}];
    [self addSubview:manImage];
    
    UILabel *manLabel = [UILabel initLabelText:@"2015-10-15 15:30" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#666666"]];
    [manLabel setFrame:(CGRect){30,82,MainWidth-160,30}];
    [self addSubview:manLabel];
    
    UIImageView *manImage2 = [UIImageView new];
    manImage2.backgroundColor = [UIColor clearColor];
    manImage2.image = [UIImage imageNamed:@"人数.png"];
    [manImage2 setFrame:(CGRect){MainWidth - 80,90,15,15}];
    [self addSubview:manImage2];
    
    UILabel *manLabel2 = [UILabel initLabelText:@"10/20" sizeFont:17.0f backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"#666666"]];
    manLabel2.textAlignment = NSTextAlignmentCenter;
    [manLabel2 setFrame:(CGRect){MainWidth - 60,82,45,30}];
    [self addSubview:manLabel2];

}

- (void)Label:(float)getY {
    
    UILabel *label = [UILabel initLabelText:@"" sizeFont:17.0f backgroundColor:[UIColor colorWithHexString:@"#D9D9D9"] textColor:[UIColor clearColor]];
    [label setFrame:(CGRect){0,getY,MainWidth,1}];
    
    [self addSubview:label];
}

@end
