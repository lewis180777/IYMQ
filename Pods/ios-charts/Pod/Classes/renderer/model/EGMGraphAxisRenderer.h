//
//  EGMGraphAxisRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"
#import "EGMGraphLineRenderer.h"
#import "EGMGraphLabelManager.h"
#import "EGMGraphLineManager.h"
#import "EGMGraphAxisValue.h"



@interface EGMGraphAxisRenderer : EGMGraphItemRenderer

@property (nonatomic, strong) NSArray *axisValues;

@property (nonatomic, strong) EGMGraphLineManager *dividersManager;
@property (nonatomic, strong) EGMGraphLabelManager *labelManager;
@property (nonatomic, assign) CGFloat axisStartPaddingPx;
@property (nonatomic, assign) CGFloat axisEndPaddingPx;


- (void)initWithP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color paddingFirst:(CGFloat)paddingFirst paddingLast:(CGFloat)paddingLast graph:(EGMGraphView *)graph  spacingLabelsAxis:(CGFloat)spacingLabelAxis spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis axisValues:(NSArray *)axisValues verticalLabels:(BOOL)verticalLabels verticalDefinitionLabels:(BOOL)verticalDefinitionLabels dividerLength:(CGFloat)dividerLength definitionLabels:(NSArray *) definitionLabels labelsFont:(UIFont *)labelsFont labelsFontColor:(UIColor *)labelsFontColor axisLabelFont:(UIFont *)axisLabelFont axisLabelFontColor:(UIColor *)axisLabelFontColor;

- (CGFloat)length;

- (CGFloat)getPXPositionForYAxisScalar:(CGFloat)scalar graph:(EGMGraphView *)graph modelLengthY:(CGFloat)modelLengthY;
- (CGFloat)getPXPositionForXAxisScalar:(CGFloat)scalar graph:(EGMGraphView *)graph modelLengthX:(CGFloat)modelLengthX;


- (CGPoint)getOrigin;

/**
 Size of rect containing axis line, labels etc
 */
- (CGSize)getSize;


- (void)setLineRenderer_:(EGMGraphLineRenderer *)renderer;

- (NSArray *)getDividersFixedCoordPositions;

- (CGPoint)axisEndPoint;

- (CGFloat)getPXPositionScalar:(CGFloat)scalar;

+ (NSArray *)generateXAxisValuesWithDataPointsNew:(NSArray *)dataPoints segmentCount:(CGFloat)segmentCount multiple:(NSInteger)multiple axisValueGenerator:(EGMGraphAxisValue *(^)(CGFloat))axisValueGenerator;

+ (NSArray *)generateYAxisValuesWithDataPointsNew:(NSArray *)dataPoints minSegmentCount:(CGFloat)minSegmentCount maxSegmentCount:(CGFloat)maxSegmentCount multiple:(NSInteger)multiple axisValueGenerator:(EGMGraphAxisValue *(^)(CGFloat))axisValueGenerator addPaddingSegmentIfEdge:(BOOL)addPaddingSegmentIfEdge ;

- (void)addLength:(CGFloat)length;

- (void)scale:(CGFloat)factor;

@end
