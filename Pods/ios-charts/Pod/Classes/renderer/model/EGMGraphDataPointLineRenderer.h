//
//  EGMGraphDataPointLineRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 27/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRenderer.h"
#import "EGMGraphLineRenderer.h"

@interface EGMGraphDataPointLineRenderer : EGMGraphDataPointRenderer

@property (nonatomic, strong) EGMGraphLineRenderer *lineRenderer;

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint lineRenderer: (EGMGraphLineRenderer *)lineRenderer;

@end
