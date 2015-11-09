//
//  EGMDataPointsSection.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMDataPointsLineModel.h"

@interface EGMDataPointsLineModel()

@end

@implementation EGMDataPointsLineModel

- (instancetype)initWithDataPoints:(NSArray *)dataPoints lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay {
    self = [super init];
    if (self) {
        self.dataPoints = dataPoints;
        self.lineColor = lineColor;
        self.animDuration = animDuration;
        self.animDelay = animDelay;
    }
    return self;
}

- (NSInteger)dataPointsCount {
    return self.dataPoints.count;
}

@end
