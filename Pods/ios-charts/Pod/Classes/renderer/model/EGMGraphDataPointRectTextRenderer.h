//
//  EGMGraphDataPointRectTextRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 20/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRectRenderer.h"
#import "EGMGraphDataPoint.h"

@interface EGMGraphDataPointRectTextRenderer : EGMGraphDataPointRectRenderer

@property (nonatomic, strong)NSString *text;

// constructor for fit rect bounds
- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor textFont:(UIFont *)textFont fitBounds:(BOOL)fitBounds fitBoundsPaddingH:(CGFloat)fitBoundsPaddingH fitBoundsPaddingV:(CGFloat)fitBoundsPaddingV;

// constructor for fixed rect size
- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

    
@end
