//
//  EGMGraphMultilineManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointsManager.h"

@class EGMDataPointsLineModel;

@interface EGMGraphLinesManager : EGMGraphDataPointsManager

@property (nonatomic, assign) BOOL drawLinesBetweenDataPointsWithSameXValue;

- (instancetype)initWithDataPointsLineModel:(EGMDataPointsLineModel *)lineModel dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing;

- (instancetype)initWithDataPointsLineModels:(NSArray *)lineModels dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing;

@end
