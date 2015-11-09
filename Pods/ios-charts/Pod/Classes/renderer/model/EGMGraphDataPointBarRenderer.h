//
//  EGMGraphDataPointBarRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRenderer.h"

@interface EGMGraphDataPointBarRenderer : EGMGraphDataPointRenderer

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rect:(CGRect)rect;

+ (CGRect)getRectForPoint:(CGPoint)point barWidth:(CGFloat)barWidth origin:(CGPoint)origin axis:(NSInteger)axis;

@end
