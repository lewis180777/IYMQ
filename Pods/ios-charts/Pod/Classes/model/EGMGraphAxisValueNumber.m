//
//  EGMGraphAxisValueNumber.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphAxisValueNumber.h"
#import "EGMGraphUtils.h"
#import "EGMGraphAxisLabel.h"

@interface EGMGraphAxisValueNumber()

@property (nonatomic, assign) CGFloat number;
@property (nonatomic, assign) NSInteger decimals;

@end

@implementation EGMGraphAxisValueNumber

- (instancetype)initWithNumber:(CGFloat)number {
    return [self initWithNumber:number decimals:2];
}

- (instancetype)initWithNumber:(CGFloat)number decimals:(NSInteger)decimals {
    self = [super init];
    if (self) {
        self.number = number;
        self.decimals = decimals;
    }
    return self;
}

- (NSArray *)labels {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumFractionDigits:0];
    [formatter setMaximumFractionDigits:self.decimals];
    NSString *str = [formatter stringFromNumber:[NSNumber numberWithFloat:self.number]];
    EGMGraphAxisLabel *graphAxisLabel = [[EGMGraphAxisLabel alloc] initWithText:str color:[UIColor blackColor] font:[[UIFont alloc] init]];
    return [NSArray arrayWithObjects: graphAxisLabel, nil];
}

- (CGFloat)scalar {
    return self.number;
}


- (void)setScalar:(CGFloat)scalar {
    self.number = scalar;
}

- (EGMGraphAxisValue *)clone {
    EGMGraphAxisValueNumber * clone = [[EGMGraphAxisValueNumber alloc] init];
    clone.decimals = self.decimals;
    clone.scalar = self.scalar;
    return clone;
}

@end
