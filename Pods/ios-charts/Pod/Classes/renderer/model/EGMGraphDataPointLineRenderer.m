//
//  EGMGraphDataPointLineRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 27/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointLineRenderer.h"

@implementation EGMGraphDataPointLineRenderer

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint lineRenderer: (EGMGraphLineRenderer *)lineRenderer {
    self = [super init];
    if (self) {
        self.pointPx = pointPx;
        self.dataPoint = dataPoint;
        self.lineRenderer = lineRenderer;
    }
    return self;
}


- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
    [self.lineRenderer onRender:context graph:graph];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    [self.lineRenderer onAddOverlays:graph];
}

- (BOOL)contains:(CGPoint)pointPx {
    return [self.lineRenderer contains:pointPx];
}

- (void)cleanup {
    [self.lineRenderer cleanup];
}

- (void)addOffset:(CGPoint)offset {
    [self.lineRenderer addOffset:offset];
}

- (CGRect)getRect {
    return [self.lineRenderer getRect];
}

@end
