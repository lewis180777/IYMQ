//
//  EGMGraphAxisLabel.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphAxisLabel.h"

@interface EGMGraphAxisLabel()

@property (nonatomic, strong, readwrite) NSString *text;
@property (nonatomic, strong, readwrite) UIColor *color;
@property (nonatomic, strong, readwrite) UIFont *font;
@end

@implementation EGMGraphAxisLabel

- (instancetype)initWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font {
    self = [super init];
    if (self) {
        self.text = text;
        self.color = color;
        self.font = font;
    }
    return self;
}

@end
