//
//  EGMDataPointsLineRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMDataPointsLineRenderer.h"

@implementation EGMDataPointsLineRenderer

- (instancetype)initWithDataPointsRenderers:(NSArray *)dataPointsRenderers lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay {
    self = [super init];
    if (self) {
        self.dataPointsRenderers = dataPointsRenderers;
        self.lineColor = lineColor;
        self.animDuration = animDuration;
        self.animDelay = animDelay;
    }
    return self;
}

@end
