//
//  EGMGraphDataPointTargetingRenderer.h
//  newgraph
//
//  Created by Ivan Schuetz on 03/10/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRenderer.h"

@interface EGMGraphDataPointTargetingRenderer : EGMGraphDataPointRenderer

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay;

@end
