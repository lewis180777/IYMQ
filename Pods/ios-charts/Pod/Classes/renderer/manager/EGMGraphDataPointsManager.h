//
//  EGMGraphDataPointsManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemsManager.h"
#import "EGMGraphDataPointRenderer.h"
#import "EGMGraphItemRenderer.h"
#import "EGMGraphAxisRenderer.h"

@class EGMGraphView;

/**
 * Renders a group of data points in the graph
 *
 * We use instances of this class in order to pass the data points to the graph
 *
 * If we need custom logic concerning the rendering of the data points as a group - e.g. render a line between them, certain timing / synchronization, etc., we subclass this class
 *
 * We can pass multiple data point managers to the graph, which act as layers: the last managers in the list are rendered on top of the previous ones.
 * This is useful to combine and reuse different components, we can e.g. draw bars and on top of them a line, only by passing a list with 2 managers, one does the bars, other the line. We can combine these managers in different ways in other graphs.
 *
 */
@interface EGMGraphDataPointsManager : EGMGraphItemsManager

@property (nonatomic, strong, readonly) NSArray *dataPoints;
@property (nonatomic, copy) EGMGraphDataPointRenderer *(^dataPointRendererGenerator)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *);


- (instancetype)initWithDataPoints:(NSArray *)dataPoints dataPointRendererGenerator:(EGMGraphDataPointRenderer *(^)(CGPoint, EGMGraphDataPoint *, NSInteger, CGPoint, EGMGraphView *))dataPointRendererGenerator minYSpacing:(CGFloat)minYSpacing;

- (NSArray *)generateDataPointRenderers:(NSArray *)dataPoints xAxis:(EGMGraphAxisRenderer *)xAxis yAxis:(EGMGraphAxisRenderer *)yAxis xAxisValues:(NSArray *)xAxisValues
                         yAxisValues:(NSArray *)yAxisValues graph:(EGMGraphView *)graph;


@end
