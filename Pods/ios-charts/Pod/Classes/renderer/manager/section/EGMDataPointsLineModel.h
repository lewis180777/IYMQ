//
//  EGMDataPointsSection.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGMDataPointsLineModel : NSObject

@property (nonatomic, strong) NSArray *dataPoints;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) CGFloat animDelay;

- (instancetype)initWithDataPoints:(NSArray *)dataPoints lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay;

- (NSInteger)dataPointsCount;

@end
