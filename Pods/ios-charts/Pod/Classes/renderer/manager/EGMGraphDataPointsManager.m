//
//  EGMGraphDataPointsManager.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointsManager.h"
#import "EGMGraphDataPointRectTextRenderer.h"
#import "EGMGraphDataPointRectWithNoteTextRenderer.h"
#import "EGMGraphDataPointBarRenderer.h"
#import "EGMGraphAxisRenderer.h"
#import "EGMGraphUtils.h"
#import "EGMGraphView.h"
#import "EGMGraphRectConflictSolver.h"

@interface EGMGraphDataPointsManager()
@property (nonatomic, strong) NSArray *dataPoints;
@property (nonatomic, assign) CGFloat minYSpacing;

@end

@implementation EGMGraphDataPointsManager


- (NSArray *)generateDataPointRenderers:(NSArray *)dataPoints xAxis:(EGMGraphAxisRenderer *)xAxis yAxis:(EGMGraphAxisRenderer *)yAxis xAxisValues:(NSArray *)xAxisValues yAxisValues:(NSArray *)yAxisValues graph: (EGMGraphView *)graph {
    
    NSMutableArray *dataPointRenderers = [NSMutableArray array];
    
    for (int i = 0; i < [dataPoints count]; i++) {
        EGMGraphDataPoint *dataPoint = dataPoints[i];
        
        CGFloat dataPointScalarX = [dataPoint getXValue].scalar;
        CGFloat dataPointScalarY = [dataPoint getYValue].scalar;
        
        CGFloat dataPointRectX = [xAxis getPXPositionScalar:dataPointScalarX];
        CGFloat dataPointRectY = [yAxis getPXPositionScalar:dataPointScalarY];
        
        CGPoint dataPointPx = CGPointMake(dataPointRectX, dataPointRectY);
        
        CGPoint originPx = CGPointMake([xAxis getOrigin].x, [xAxis getOrigin].y);
        
        EGMGraphDataPointRenderer *dataPointRenderer = self.dataPointRendererGenerator(dataPointPx, dataPoint, i, originPx, graph);
        if (dataPointRenderer) { //we allow the generator to return nil - then we just dont add anything
            [dataPointRenderers addObject:dataPointRenderer];
        }
    }
    
    if (dataPointRenderers.count && ([[dataPointRenderers.firstObject class] isSubclassOfClass: [EGMGraphDataPointRectRenderer class]] || [[dataPointRenderers.firstObject class] isSubclassOfClass: [EGMGraphDataPointRectWithNoteTextRenderer class]])) {
        [[[EGMGraphRectConflictSolver alloc] init] solveConflictsForDataPointRenderers:dataPointRenderers];
    }
    
    return dataPointRenderers;
}

- (instancetype)initWithDataPoints:(NSArray *)dataPoints dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing {
    self = [super init];
    if (self) {
        self.dataPoints = dataPoints;
        self.dataPointRendererGenerator = dataPointRendererGenerator;
        self.minYSpacing = minYSpacing;
    }
    
    return self;
}


@end
