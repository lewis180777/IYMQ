//
//  EGMGraphDataPointRectRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRenderer.h"
#import "EGMGraphDataPoint.h"

@interface EGMGraphDataPointRectRenderer : EGMGraphDataPointRenderer

@property (nonatomic, assign) CGSize rectSize;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGRect rect;

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
