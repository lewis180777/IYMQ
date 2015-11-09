//
//  EGMGraphDataPointRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"
#import "EGMGraphDataPoint.h"

@interface EGMGraphDataPointRenderer: EGMGraphItemRenderer

@property (nonatomic, strong) EGMGraphDataPoint *dataPoint;

@property (nonatomic, assign) BOOL conflictSolved;


- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint;

// change view's origin manually - this is useful to allow conflict solver to re-layout views to prevent overlapping
- (void)setOrigin:(CGPoint)point;

- (CGRect)getRect;

- (void)setItemAlignement:(NSInteger)itemAlignement;

@end