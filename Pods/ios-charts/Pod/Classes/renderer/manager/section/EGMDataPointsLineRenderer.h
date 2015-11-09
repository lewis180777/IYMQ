//
//  EGMDataPointsLineRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGMDataPointsLineRenderer : NSObject

@property (nonatomic, strong) NSArray *dataPointsRenderers;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) CGFloat animDelay;

- (instancetype)initWithDataPointsRenderers:(NSArray *)dataPointsRenderers lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay;

@end
