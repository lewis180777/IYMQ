//
//  EGMGraphMultilineManager.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLinesManager.h"
#import "EGMDataPointsLineModel.h"
#import "EGMGraphLineView.h"
#import "EGMGraphView.h"
#import "EGMDataPointsLineRenderer.h"

@interface EGMGraphLinesManager()

@property (nonatomic, strong) NSMutableArray *lineModels;
@property (nonatomic, strong) NSMutableArray *lineViews;


@end

@implementation EGMGraphLinesManager


- (instancetype)initWithDataPointsLineModel:(EGMDataPointsLineModel *)lineModel dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing {
    NSArray *lineModels = [NSArray arrayWithObjects:lineModel, nil];
    return [self initWithDataPointsLineModels: lineModels dataPointRendererGenerator:dataPointRendererGenerator minYSpacing:minYSpacing];
}

- (instancetype)initWithDataPointsLineModels:(NSArray *)lineModels dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing {
    
    // pass datapoints from all lines to superclass
    // this allows superclass to solve possible conflicts among all points
    NSArray *allDataPoints = [self allDataPointsFromLineModels:lineModels];
    self = [super initWithDataPoints:allDataPoints dataPointRendererGenerator:dataPointRendererGenerator minYSpacing:minYSpacing];
    
    if (self) {
        self.lineModels = [lineModels mutableCopy];
        self.lineViews = [NSMutableArray array];
        self.drawLinesBetweenDataPointsWithSameXValue = NO;
    }
    return self;
}

- (NSArray *)allDataPointsFromLineModels:(NSArray *)lineModels {
    NSMutableArray *allDataPoints = [[NSMutableArray alloc] init];
    for (EGMDataPointsLineModel *lineModel in lineModels) {
        [allDataPoints addObjectsFromArray:lineModel.dataPoints];
    }
    return allDataPoints;
}


- (void)onAddOverlays:(EGMGraphView *)graph {
    if (self.itemsRenderers && self.itemsRenderers.count > 0) {
    
        NSMutableArray *points = [NSMutableArray array];
        
        // now we got all renderers with their final position, we have to assign them to their respective lines
        NSMutableArray *lineModelsRenderers = [NSMutableArray array];
        for (EGMDataPointsLineModel *lineModel in self.lineModels) {
            NSMutableArray *lineModelRenderers = [NSMutableArray array];
            
            for (EGMGraphDataPoint *dataPoint in lineModel.dataPoints) {
                EGMGraphDataPointRenderer *renderer = [self findRendererForDataPoint:dataPoint];
                [lineModelRenderers addObject:renderer];
            }
            
            [lineModelsRenderers addObject: [[EGMDataPointsLineRenderer alloc] initWithDataPointsRenderers:lineModelRenderers lineColor:lineModel.lineColor animDuration:lineModel.animDuration animDelay:lineModel.animDelay]];
        }
        
        // draw lines...
        for (EGMDataPointsLineRenderer *dataPointsLineRenderer in lineModelsRenderers) {
            NSArray *dataPointsRenderers = dataPointsLineRenderer.dataPointsRenderers;
            
            if (!self.drawLinesBetweenDataPointsWithSameXValue) {
                dataPointsRenderers = [self removeDataPointsRendererWithSameXValues:dataPointsRenderers];
            }
            
            // collect points
            NSMutableArray *points = [NSMutableArray array];
            for (EGMGraphDataPointRenderer *dataPointRenderer in dataPointsRenderers) {
                if (!dataPointRenderer.hidden) {
                    [points addObject:[NSValue valueWithCGPoint:dataPointRenderer.pointPx]];
                }
            }
            
            if (points.count) {
                // draw line
                UIView *lineView = [[EGMGraphLineView alloc] initWithPoints:points frame:graph.bounds lineColor:dataPointsLineRenderer.lineColor animDuration:dataPointsLineRenderer.animDuration area:NO animDelay:dataPointsLineRenderer.animDelay];
                [self.lineViews addObject:lineView];
                [graph addSubview:lineView];
            }
        }
        
        for (EGMGraphDataPointRenderer *dataPointRenderer in self.itemsRenderers) {
            [dataPointRenderer onAddOverlays:graph];
            
            if (!dataPointRenderer.hidden) {
                [points addObject:[NSValue valueWithCGPoint:dataPointRenderer.pointPx]];
            }
        }
    }
}

// Filtering of multiple datapoints with same x value - last one stays
// NOTE: assumes dataPointsRenderers sorted by x (datapoint) value in ascending order
- (NSArray *)removeDataPointsRendererWithSameXValues:(NSArray *)dataPointsRenderers {
    NSMutableArray *filtered = [NSMutableArray array];
    if (dataPointsRenderers && dataPointsRenderers.count) {
        EGMGraphDataPointRenderer *lastRenderer = [dataPointsRenderers firstObject];
        for (EGMGraphDataPointRenderer *renderer in dataPointsRenderers) {
            if (![[renderer.dataPoint getXValue] isEqual:[lastRenderer.dataPoint getXValue]]) {
                [filtered addObject:lastRenderer];
            }
            lastRenderer = renderer;
        }
        [filtered addObject:lastRenderer];
    }
    return filtered;
}


//TODO does this work? we should use same references so yes, but not good style
//maybe also create a tmp list with the datapoints where we remove the point after finding it to improve performance
- (EGMGraphDataPointRenderer *)findRendererForDataPoint:(EGMGraphDataPoint *)dataPoint {
    for (EGMGraphDataPointRenderer *dataPointRenderer in self.itemsRenderers) {
        if ([dataPointRenderer.dataPoint isEqual:dataPoint]) {
            return dataPointRenderer;
        }
    }
    return nil;
}

- (void)cleanup {
    for (EGMGraphLineView *lineView in self.lineViews) {
        [lineView removeFromSuperview];
    }
}

- (void)addOffset:(CGPoint)offset {
    [super addOffset:offset];
}
    

@end
