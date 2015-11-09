//
//  EGMGraphAxisRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphAxisRenderer.h"
#import "EGMGraphAxisValue.h"
#import "EGMGraphDataPoint.h"
#import "EGMGraphUtils.h"
#import "EGMGraphView.h"
#import "EGMGraphAxisLabel.h"


CGFloat const axisStrokeWidth = 2.0;
CGFloat const dividerStrokeWidth = 2.0;

@interface EGMGraphAxisRenderer()

@property (nonatomic, strong) EGMGraphLineRenderer *lineRenderer;
@property (nonatomic, assign) CGFloat spacingLabelAxis;
@property (nonatomic, assign) CGFloat spacingLabelBetweenAxis; // TODO create a wrapper for multiple labels, contains spacing, remove from here

@property (nonatomic, weak) EGMGraphView *graphView;

@property (nonatomic, assign) CGFloat labelsMaxWidth;
@property (nonatomic, assign) CGFloat labelsMaxHeight;

@property (nonatomic, assign) BOOL verticalLabels;
@property (nonatomic, assign) BOOL verticalDefinitionLabels;

@property (nonatomic, assign) CGFloat dividerLength;

@property (nonatomic, strong) NSDictionary *definitionLabelsFontAttributes;

@property (nonatomic, strong) NSArray *definitionLabels;

@property (nonatomic, strong) UIFont *labelsFont;
@property (nonatomic, strong) UIColor *labelsFontColor;
@property (nonatomic, strong) UIFont *axisLabelFont;
@property (nonatomic, strong) UIColor *axisLabelFontColor;
@property (nonatomic, strong) UIColor *lineColor;


//TODO maybe remove this if its not going to be used
@property (nonatomic, assign, readonly) BOOL isAxisLineVisible;

@property (nonatomic, assign, readonly) CGPoint endPoint;

@end

@implementation EGMGraphAxisRenderer


- (instancetype)init {
    self = [super init];
    if (self) {
        self.axisStartPaddingPx = 0;
        self.axisEndPaddingPx = 0;
        self.spacingLabelAxis = 0;
        self.spacingLabelBetweenAxis = 0;
    }
    return self;
}



- (void)initWithP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color paddingFirst:(CGFloat)paddingFirst paddingLast:(CGFloat)paddingLast graph:(EGMGraphView *)graphView spacingLabelsAxis:(CGFloat)spacingLabelAxis spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis axisValues:(NSArray *)axisValues verticalLabels:(BOOL)verticalLabels verticalDefinitionLabels:(BOOL)verticalDefinitionLabels dividerLength:(CGFloat)dividerLength definitionLabels:(NSArray *) definitionLabels labelsFont:(UIFont *)labelsFont labelsFontColor:(UIColor *)labelsFontColor axisLabelFont:(UIFont *)axisLabelFont axisLabelFontColor:(UIColor *)axisLabelFontColor {
    
    self.axisStartPaddingPx = paddingFirst;
    self.axisEndPaddingPx = paddingLast;
    
    self.axisValues = axisValues;
    
    self.verticalLabels = verticalLabels;
    self.verticalDefinitionLabels = verticalDefinitionLabels;
    
    self.dividerLength = dividerLength;
    
    self.labelsFont = labelsFont;
    self.labelsFontColor = labelsFontColor;
    
    //TODO only relevant dimension
    NSDictionary *labelsFontAttributes = @{NSFontAttributeName: self.labelsFont, NSForegroundColorAttributeName: self.labelsFontColor};
    
    self.labelsMaxWidth = [EGMGraphUtils getMaxLabelWidth:self.axisValues fontAttributes:labelsFontAttributes verticalLabels:self.verticalLabels];
    self.labelsMaxHeight = [EGMGraphUtils getMaxLabelHeight:self.axisValues fontAttributes:labelsFontAttributes verticalLabels:self.verticalLabels spacing:self.spacingLabelBetweenAxis];
    
    self.graphView = graphView;
    
    self.spacingLabelAxis = spacingLabelAxis;
    self.spacingLabelBetweenAxis = spacingLabelBetweenAxis;
    self.lineColor = color;
    
    self.definitionLabels = definitionLabels;
    self.axisLabelFont = axisLabelFont;
    self.axisLabelFontColor = axisLabelFontColor;
    
    [self initLineAndDerived:p1 p2:p2];
}

/**
 Set points and init derived data
 */
- (void)initLineAndDerived:(CGPoint)p1 p2:(CGPoint)p2 {
    [self.lineRenderer setP1:p1 p2:p2 color:self.lineColor];
    
    [self initLabelsAndDividers:self.graphView spacingLabelsAxis:self.spacingLabelAxis spacingLabelBetweenAxis:self.spacingLabelBetweenAxis fontAttributes:[EGMGraphUtils getLabelStringAttributesForFont:self.labelsFont color:self.labelsFontColor] verticalLabels:self.verticalLabels];
}

- (CGPoint)endPoint {
    return self.lineRenderer.p2;
}

- (EGMGraphLabelRenderer *)rendererFromLabelModel:(EGMGraphAxisLabel *)label {
    EGMGraphLabelRenderer *axisLabelRenderer = [[EGMGraphLabelRenderer alloc] init];
    axisLabelRenderer.text = label.text;
    axisLabelRenderer.fontColor = label.color;
    axisLabelRenderer.font = label.font;
    return axisLabelRenderer;
}

- (NSArray *)generateDefinitionLabelRenderersForDefinitionLabels:(NSArray *)definitionLabels spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis {
    NSArray *axisLabelRenderers;
    
    if ([self isHorizontal]) {
        if (self.verticalDefinitionLabels) {
            if (definitionLabels.count > 1) {
                NSLog(@"WARNING: No support for  multiple labels - using only first one");
            }
            EGMGraphAxisLabel *axisLabel = [definitionLabels firstObject];
            EGMGraphLabelRenderer *axisLabelRenderer = [self rendererFromLabelModel:axisLabel];
            axisLabelRenderer.rotation = -90;
            axisLabelRenderer.anchor = 2;
            axisLabelRenderer.keepSameXCenterAfterRotation = NO;
            
            CGPoint labelPoint = CGPointMake(self.endPoint.x + 20, self.endPoint.y);
            axisLabelRenderer.pointPx = labelPoint;
            axisLabelRenderers = [NSArray arrayWithObjects:axisLabelRenderer, nil];
            
        } else {
            axisLabelRenderers = [self generateXDefinitionLabelRenderers:definitionLabels spacingLabelAxisX:self.spacingLabelAxis fontAttributes:[EGMGraphUtils getLabelStringAttributesForFont:self.labelsFont color:self.labelsFontColor] spacingLabelBetweenAxis:spacingLabelBetweenAxis];
        }
        
    } else { // vertical axis
        if (definitionLabels.count > 1) {
            NSLog(@"WARNING: No support for  multiple labels - using only first one");
        }
        EGMGraphAxisLabel *axisLabel = [definitionLabels firstObject];
        EGMGraphLabelRenderer *axisLabelRenderer = [self rendererFromLabelModel:axisLabel];
        
        CGSize labelSize = [axisLabelRenderer getRenderedTextSize:axisLabel.text];
        CGPoint labelPoint = CGPointMake(self.endPoint.x - (labelSize.width / 2), self.endPoint.y - 40 - (labelSize.height / 2));
        axisLabelRenderer.pointPx = labelPoint;
        axisLabelRenderers = [NSArray arrayWithObjects:axisLabelRenderer, nil];
    }
    
    return axisLabelRenderers;
}


- (CGSize)getSize {
    CGSize rect;
    if ([self isHorizontal]) {
        rect = CGSizeMake([self length], self.labelsMaxHeight + self.spacingLabelAxis + axisStrokeWidth);
    } else {
        CGFloat width = self.labelsMaxWidth + self.spacingLabelAxis + axisStrokeWidth;
        rect = CGSizeMake(width, [self length]);
    }
    return rect;
}

- (CGFloat)getModelLength {
    
    NSArray *axisValues = self.axisValues;
    
    if (!axisValues || axisValues.count == 0) {
        return 0;
    }
    //assumes points are sorted increasing by x
    EGMGraphAxisValue *firstAxisValue = [axisValues objectAtIndex:0];
    EGMGraphAxisValue *lastAxisValue = [axisValues objectAtIndex:(axisValues.count - 1)];
    
    return fabsf(lastAxisValue.scalar - firstAxisValue.scalar);
}

- (void)initLabelsAndDividers:(EGMGraphView *)graphView spacingLabelsAxis:(CGFloat)spacingLabelsAxis spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels {
    
    self.spacingLabelAxis = spacingLabelsAxis;
    CGFloat modelLength = [self getModelLength];
    self.graphView = graphView;
    
    NSMutableArray *dividers;
    NSMutableArray *labels;
    
    NSArray *definitionLabelRenderers = [self generateDefinitionLabelRenderersForDefinitionLabels:self.definitionLabels spacingLabelBetweenAxis:spacingLabelBetweenAxis];
    
    if ([self isHorizontal]) {
        dividers = [self generateXDividers:graphView modelLength:modelLength];
        labels = [self generateXLabelRenderers:graphView modelLength:modelLength spacingLabelAxisX:spacingLabelsAxis spacingLabelBetweenAxis:spacingLabelBetweenAxis fontAttributes:fontAttributes verticalLabels: verticalLabels];
    } else {
        dividers = [self generateYDividers:graphView modelLength:modelLength];
        labels = [self generateYLabels:graphView modelLength:modelLength spacingLabelAxisY:spacingLabelsAxis fontAttributes:fontAttributes];
    }
    
    self.dividersManager.lines = dividers;
    
    [labels addObjectsFromArray:definitionLabelRenderers];
    self.labelManager.labels = labels;
    
    self.dividersManager.hideLines = YES; //FIXME
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
    if (self.isAxisLineVisible) {
        CGContextSetLineWidth(context, axisStrokeWidth);
        [self.lineRenderer onRender:context graph:graph];
    }
    
    CGContextSetLineWidth(context, dividerStrokeWidth);
    
    [self.dividersManager onRender:context graph:graph];
    
    [self.labelManager onRender:context graph:graph];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    [self.lineRenderer onAddOverlays:graph];
    [self.labelManager onAddOverlays:graph];
    [self.dividersManager onAddOverlays:graph];
}

+ (NSArray *)generateXAxisValuesWithDataPointsNew:(NSArray *)dataPoints segmentCount:(CGFloat)segmentCount multiple:(NSInteger)multiple axisValueGenerator:(EGMGraphAxisValue *(^)(CGFloat))axisValueGenerator {
    
    NSMutableArray * axisValues = [NSMutableArray array];
    
    NSArray *sortedDataPoints = [dataPoints sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        CGFloat first = ((EGMGraphAxisValue *)[(EGMGraphDataPoint*)a getXValue]).scalar;
        CGFloat second = ((EGMGraphAxisValue *)[(EGMGraphDataPoint*)b getXValue]).scalar;
        return [[NSNumber numberWithDouble:first] compare:[NSNumber numberWithDouble:second]];
    }];
    
    EGMGraphDataPoint *first = sortedDataPoints[0];
    EGMGraphDataPoint *last = sortedDataPoints[[dataPoints count] - 1];
    
    CGFloat lastDataPointScalar = ((EGMGraphAxisValue *)[last getXValue]).scalar;
    CGFloat firstDataPointScalar = ((EGMGraphAxisValue *)[first getXValue]).scalar;
    
    firstDataPointScalar = round_down(firstDataPointScalar, multiple);
    CGFloat offset = firstDataPointScalar;
    
    CGFloat distance = lastDataPointScalar - firstDataPointScalar;
    
    CGFloat segmentSize;
    BOOL adjustStepCountToFitAfterResize = YES;
    
    segmentSize = distance / segmentCount;
    
    if (multiple) {
        for (int i = 1; i < INT_MAX; i++) {
            CGFloat segmentSizeMultTmp = multiple * i;
            
            CGFloat distanceUsingTmpSegmentSize = segmentSizeMultTmp * segmentCount;
            
            if (distanceUsingTmpSegmentSize >= distance) {
                multiple = segmentSizeMultTmp;
                break;
            }
        }
        segmentSize = multiple;
        if (adjustStepCountToFitAfterResize) {
            segmentCount = (distance / segmentSize) + 1;
        }
    }
    
    for (int i = 0; i <= segmentCount; i++) {
        CGFloat scalar = offset + (i * segmentSize);
        EGMGraphAxisValue *axisValue = axisValueGenerator(scalar);
        [axisValues addObject:axisValue];
    }
    
    return axisValues;
}


CGFloat round_up(NSInteger num, NSInteger factor) {
    return num + factor - 1 - (num - 1) % factor;
}

CGFloat round_down(NSInteger num, NSInteger factor) {
    return round_up(num, factor) - factor;
}


- (CGFloat)getPXPositionScalar:(CGFloat)scalar {
    CGFloat result;
    
    CGFloat axisLengthPx = [self length];
    CGFloat axisLengthModel = [self getModelLength];
    CGFloat originModel = ((EGMGraphAxisValue *)self.axisValues[0]).scalar;
    
    CGFloat originPx;
    if ([self isHorizontal]) {
        originPx = [self getOrigin].x;
    } else {
        originPx = [self getOrigin].y;
    }
    
    result = (scalar - originModel) * axisLengthPx / axisLengthModel;
    
    if (![self isHorizontal]) { // if we are in y we need to "invert" to get correct screen coordinate
        result = originPx - result;
    } else {
        result = result + originPx;
    }
    
    return result;
}


+ (NSArray *)generateYAxisValuesWithDataPointsNew:(NSArray *)dataPoints minSegmentCount:(CGFloat)minSegmentCount maxSegmentCount:(CGFloat)maxSegmentCount multiple:(NSInteger)multiple axisValueGenerator:(EGMGraphAxisValue *(^)(CGFloat))axisValueGenerator addPaddingSegmentIfEdge:(BOOL)addPaddingSegmentIfEdge {
    
    if (!dataPoints || [dataPoints count] == 0) {
        NSLog(@"Trying to generate Y axis without datapoints...");
        return nil;
    }
    
    if (multiple == -1) {
        multiple = 10;
    }
    
    NSMutableArray * axisValues = [NSMutableArray array];
    
    NSArray *sortedDataPoints = [dataPoints sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        CGFloat first = ((EGMGraphAxisValue *)[(EGMGraphDataPoint*)a getYValue]).scalar;
        CGFloat second = ((EGMGraphAxisValue *)[(EGMGraphDataPoint*)b getYValue]).scalar;
        return [[NSNumber numberWithDouble:first] compare:[NSNumber numberWithDouble:second]];
    }];
    
    EGMGraphDataPoint *first = sortedDataPoints[0];
    EGMGraphDataPoint *last = sortedDataPoints[[dataPoints count] - 1];
    
    CGFloat lastDataPointScalar = ((EGMGraphAxisValue *)[last getYValue]).scalar;
    CGFloat firstDataPointScalar = ((EGMGraphAxisValue *)[first getYValue]).scalar;
    
    
    CGFloat firstValue = ((NSInteger)(firstDataPointScalar)) - (((NSInteger)(firstDataPointScalar)) % multiple);
    CGFloat lastValue = ((NSInteger)(lastDataPointScalar)) + (multiple - (((NSInteger)(lastDataPointScalar)) % multiple));
    
    CGFloat segmentSize = multiple;
    
    if (firstValue == firstDataPointScalar && addPaddingSegmentIfEdge) {
        firstValue = firstValue - segmentSize;
    }
    if (lastValue == lastDataPointScalar && addPaddingSegmentIfEdge) {
        lastValue = lastValue + segmentSize;
    }
    
    CGFloat currentMultiple = multiple;
    CGFloat distance = lastValue - firstValue;
    
    CGFloat segmentCount = distance / currentMultiple;
    
    // make larger segments if we have to many segments
    while (segmentCount > maxSegmentCount) {
        currentMultiple *= 2;
        segmentCount = distance / currentMultiple;
    }
    
    segmentCount = ceil(segmentCount);
    
    // if we have not enough segments, add more
    while (segmentCount < minSegmentCount) {
        segmentCount++;
    }
    
    segmentSize = currentMultiple;
    
    CGFloat offset = firstValue;
    
    for (int i = 0; i <= segmentCount; i++) {
        CGFloat scalar = offset + (i * segmentSize);
        EGMGraphAxisValue *axisValue = axisValueGenerator(scalar);
        [axisValues addObject:axisValue];
    }
    
    return axisValues;
}

- (void)addLength:(CGFloat)length {
    CGPoint p1;
    CGPoint p2;
    if ([self isHorizontal]) {
        p1 = self.lineRenderer.p1;
        p2 = CGPointMake(self.lineRenderer.p2.x + length, self.lineRenderer.p2.y);
        
    } else {
        p1 = CGPointMake(self.lineRenderer.p1.x, self.lineRenderer.p1.y + length);
        p2 = self.lineRenderer.p2;
    }
    
    [self initLineAndDerived:p1 p2:p2];
}

- (void)scale:(CGFloat)factor {
    CGPoint p1;
    CGPoint p2;
    if ([self isHorizontal]) {
        p1 = self.lineRenderer.p1;
        p2 = CGPointMake(self.lineRenderer.p2.x * factor, self.lineRenderer.p2.y);
        
    } else {
        p1 = CGPointMake(self.lineRenderer.p1.x, self.lineRenderer.p1.y * factor);
        p2 = self.lineRenderer.p2;
    }
    
    [self initLineAndDerived:p1 p2:p2];
}

/**
 Returns length of axis
 */
- (CGFloat)length {
    return [self axisTotalLength];
}


- (CGFloat)axisTotalLength {
    CGPoint axisP1 = self.lineRenderer.p1;
    CGPoint axisP2 = self.lineRenderer.p2;
    
    if (axisP2.x - axisP1.x == 0) {
        return abs(axisP2.y - axisP1.y);
    } else if (axisP2.y - axisP1.y == 0) {
        return abs(axisP2.x - axisP1.x);
    } else {
        NSLog(@"Error: Invalid axis");
        return -1;
    }
}

- (CGPoint)axisEndPoint {
    return self.lineRenderer.p2;
}

- (BOOL)isHorizontal {
    CGPoint axisP1 = self.lineRenderer.p1;
    CGPoint axisP2 = self.lineRenderer.p2;
    return axisP2.y - axisP1.y == 0;
}

- (CGFloat)axisLengthWithoutPadding {
    CGFloat totalLength = [self axisTotalLength];
    return totalLength - self.axisStartPaddingPx - self.axisEndPaddingPx;
}



- (void)recalculateEverything {
    [self initLabelsAndDividers:self.graphView spacingLabelsAxis:self.spacingLabelAxis spacingLabelBetweenAxis:self.spacingLabelBetweenAxis fontAttributes:[EGMGraphUtils getLabelStringAttributesForFont:self.labelsFont color:self.labelsFontColor] verticalLabels:self.verticalLabels];
}


- (void)addOffset:(CGPoint)offset {
    
    CGPoint p1 = self.lineRenderer.p1;
    CGPoint p2 = self.lineRenderer.p2;
    
    CGPoint newP1 = CGPointMake(p1.x + offset.x, p1.y + offset.y);
    CGPoint newP2 = CGPointMake(p2.x + offset.x, p2.y + offset.y);
    
    self.lineRenderer.p1 = newP1;
    self.lineRenderer.p2 = newP2;
}

- (CGPoint)getOrigin {
    return self.lineRenderer.p1;
}


- (NSMutableArray *)generateXDividers:(EGMGraphView *)graphView modelLength:(CGFloat)modelLength {
    NSMutableArray *dividers = [NSMutableArray array];
    
    for (EGMGraphAxisValue *axisValue in self.axisValues) {
        CGFloat scalar = axisValue.scalar;
        
        CGFloat scalarPXPos = [self getPXPositionForXAxisScalar:scalar graph:graphView modelLengthX:modelLength];
        
        CGFloat dividerLengthHalf = self.dividerLength / 2;
        
        CGPoint xAxisPos = [self getOrigin];
        CGFloat xAxisPosMiddle = xAxisPos.y + (axisStrokeWidth / 2); //the center is the center inside stroke
        
        CGFloat x1 = scalarPXPos;
        CGFloat y1 = xAxisPosMiddle - dividerLengthHalf;
        CGFloat x2 = x1;
        CGFloat y2 = xAxisPosMiddle + dividerLengthHalf;
        
        EGMGraphLineRenderer *lineRenderer = [[EGMGraphLineRenderer alloc] init];
        [lineRenderer setP1:CGPointMake(x1, y1) p2:CGPointMake(x2, y2) color:[UIColor blackColor]];
        
        [dividers addObject:lineRenderer];
    }
    return dividers;
}

- (NSMutableArray *)generateYDividers:(EGMGraphView *)graph modelLength:(CGFloat)modelLength {
    NSMutableArray *dividers = [NSMutableArray array];
    
    for (EGMGraphAxisValue *axisValue in self.axisValues) {
        CGFloat scalar = axisValue.scalar;
        
        CGFloat scalarPXPos = [self getPXPositionForYAxisScalar:scalar graph:graph modelLengthY:modelLength];
        
        CGFloat dividerLengthHalf = self.dividerLength / 2;
        
        CGPoint xAxisPos = [self getOrigin];
        CGFloat yAxisPosMiddle = xAxisPos.x - (axisStrokeWidth / 2); //the center is the center inside stroke
        
        CGFloat x1 = yAxisPosMiddle - dividerLengthHalf;
        CGFloat y1 = scalarPXPos;
        CGFloat x2 = yAxisPosMiddle + dividerLengthHalf;
        CGFloat y2 = y1;
        
        
        EGMGraphLineRenderer *lineRenderer = [[EGMGraphLineRenderer alloc] init];
        [lineRenderer setP1:CGPointMake(x1, y1) p2:CGPointMake(x2, y2) color:[UIColor blackColor]];
        
        [dividers addObject:lineRenderer];
    }
    return dividers;
}



// generate y labels
- (NSMutableArray *)generateYLabels:(EGMGraphView *)graph modelLength:(CGFloat)modelLength spacingLabelAxisY:(CGFloat)spacingLabelAxisY fontAttributes:(NSDictionary *)fontAttributes {
    NSMutableArray *labels = [NSMutableArray array];
    
    for (EGMGraphAxisValue *axisValue in self.axisValues) {
        CGFloat scalar = axisValue.scalar;
        
        CGFloat y = [self getPXPositionForYAxisScalar:scalar graph:graph modelLengthY:modelLength];
        
        EGMGraphAxisLabel *axisLabel = [axisValue getFirstLabel];
        CGSize labelSize = [EGMGraphUtils getRenderedTextSize:axisLabel.text fontAttributes:fontAttributes];
        CGFloat labelY = y - (labelSize.height / 2);
        CGFloat labelX = [self getOrigin].x - labelSize.width - spacingLabelAxisY;
        EGMGraphLabelRenderer *labelRenderer = [[EGMGraphLabelRenderer alloc] init];
        labelRenderer.text = axisLabel.text;
        labelRenderer.pointPx = CGPointMake(labelX, labelY);
        labelRenderer.font = self.labelsFont;
        labelRenderer.fontColor = self.labelsFontColor;
        
        [labels addObject:labelRenderer];
    }
    
    return labels;
}


- (NSArray *)generateXDefinitionLabelRenderers:(NSArray *)labels spacingLabelAxisX:(CGFloat)spacingLabelAxisX fontAttributes:(NSDictionary *)fontAttributes spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis {
    
    NSMutableArray *labelRenderers = [NSMutableArray array];
    NSMutableArray *rows = [NSMutableArray array];
    
    for (EGMGraphAxisLabel *axisLabel in labels) {
        [rows addObject:[NSArray arrayWithObjects:axisLabel.text, nil]];
    }
    
    NSArray *rowHeights = [self rowHeightsForRows:rows fontAttributes:fontAttributes verticalLabels:self.verticalLabels];
    
    for (int i = 0; i < labels.count; i++) {
        EGMGraphAxisLabel *axisLabel = labels[i];
        
        CGFloat rowY = [self calculateRowY:rowHeights currentRow:i spacing:spacingLabelBetweenAxis];
        
        CGFloat x = self.endPoint.x;
        CGFloat y = [self getOrigin].y + self.dividerLength / 2 + (axisStrokeWidth / 2) + spacingLabelAxisX + rowY;
        
        CGSize labelSize = [EGMGraphUtils getRenderedTextSize:axisLabel.text fontAttributes:fontAttributes];
        CGFloat labelX = x - labelSize.width; // align at the right
        
        EGMGraphLabelRenderer *labelRenderer = [[EGMGraphLabelRenderer alloc] init];
        
        labelRenderer.text = axisLabel.text;
        labelRenderer.pointPx = CGPointMake(labelX, y);
        labelRenderer.hidden = axisLabel.hidden;
        labelRenderer.font = axisLabel.font;
        labelRenderer.fontColor = axisLabel.color;
        
        [labelRenderers addObject:labelRenderer];
    }
    
    return labelRenderers;
}

// generate x labels
// for x axis we support multiple, vertically aligned labels for one axis value
- (NSMutableArray *)generateXLabelRenderers:(EGMGraphView *)graph modelLength:(CGFloat)modelLength spacingLabelAxisX:(CGFloat)spacingLabelAxisX  spacingLabelBetweenAxis:(CGFloat)spacingLabelBetweenAxis fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels {
    NSMutableArray *labelRenderers = [NSMutableArray array];
    
    // for now it's a requirement that all axis label lists have the same count - verify it
    NSUInteger count = 0;
    for (EGMGraphAxisValue *axisValue in self.axisValues) {
        if (![axisValue isHidden]) { // exclude possible padding values from check TODO isHidden should not be assumed to be always == padding, maybe add extra flag for padding
            NSUInteger c = axisValue.labels.count;
            if (count != 0) {
                assert(count == c);
            }
            count = c;
        }
    }
    
    // organize labels in rows, to calculate height of each row
    NSMutableArray *rows = [NSMutableArray array];
    for (int rowIndex = 0; rowIndex < count; rowIndex++) {
        NSMutableArray *row = [NSMutableArray array];
        for (EGMGraphAxisValue *axisValue in self.axisValues) {
            NSArray *axisLabels = axisValue.labels;
            if (rowIndex < axisLabels.count) {
                EGMGraphAxisLabel *axisLabel = [axisLabels objectAtIndex:rowIndex];
                [row addObject:axisLabel.text]; // only strings, this (+global fontAttributes) is what we need to calculate height
            }
        }
        [rows addObject:row];
    }
    
    NSArray *rowHeights = [self rowHeightsForRows:rows fontAttributes:fontAttributes verticalLabels:self.verticalLabels];
    
    for (EGMGraphAxisValue *axisValue in self.axisValues) {
        CGFloat scalar = axisValue.scalar;
        NSArray *labels = axisValue.labels;
        
        // render vertical labels for each axis value
        for (int i = 0; i < labels.count; i++) {
            EGMGraphAxisLabel *axisLabel = labels[i];
            
            CGFloat rowY = [self calculateRowY:rowHeights currentRow:i spacing:spacingLabelBetweenAxis];
            
            CGFloat x = [self getPXPositionForXAxisScalar:scalar graph:graph modelLengthX:modelLength];
            CGFloat y = [self getOrigin].y + self.dividerLength / 2 + (axisStrokeWidth / 2) + spacingLabelAxisX + rowY;
            
            CGSize labelSize = [EGMGraphUtils getRenderedTextSize:axisLabel.text fontAttributes:fontAttributes];
            CGFloat labelX = x - (labelSize.width / 2);
            
            EGMGraphLabelRenderer *labelRenderer = [[EGMGraphLabelRenderer alloc] init];
            if (verticalLabels) {
                labelRenderer.rotation = -90;
            }
            labelRenderer.text = axisLabel.text;
            labelRenderer.pointPx = CGPointMake(labelX, y);
            labelRenderer.hidden = axisLabel.hidden;
            labelRenderer.font = self.labelsFont;
            labelRenderer.fontColor = axisLabel.color;
            
            [labelRenderers addObject:labelRenderer];
        }
    }
    
    return labelRenderers;
}

// Calculate screen y position at top left corner of row
- (CGFloat)calculateRowY:(NSArray *)rowHeights currentRow:(NSInteger)currentRow spacing:(CGFloat)spacing {
    CGFloat rowY = 0;
    if (currentRow > 0) {
        for (int rowIndex = 0; rowIndex < currentRow; rowIndex++) {
            CGFloat rowHeight = [[rowHeights objectAtIndex:rowIndex] floatValue];
            rowY += rowHeight;
            rowY += spacing;
        }
    }
    return rowY;
}

- (NSArray *)rowHeightsForRows:(NSArray *)rows fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels {
    NSMutableArray *rowHeights = [NSMutableArray array];
    for (NSArray *row in rows) {
        CGFloat height = [EGMGraphUtils getMaxLabelHeightForStrings:row fontAttributes:fontAttributes verticalLabels:verticalLabels];
        NSNumber *heightNum = [NSNumber numberWithFloat: height];
        [rowHeights addObject:heightNum];
    }
    return rowHeights;
}


- (NSArray *)getDividersFixedCoordPositions {
    NSArray *fixedCoordPositions = [self.dividersManager getDividersFixedCoordPositions];
    return fixedCoordPositions;
}


- (CGFloat)getPXPositionForYAxisScalar:(CGFloat)scalar graph:(EGMGraphView *)graph modelLengthY:(CGFloat)modelLengthY {
    CGFloat axisLengthYPx = [self axisLengthWithoutPadding];
    
    NSInteger viewHeight = graph.bounds.size.height;
    
    CGFloat offsetAxisYPx = viewHeight - [self getOrigin].y - [self axisStartPaddingPx];;
    
    EGMGraphAxisValue *firstAxisValue = [self.axisValues objectAtIndex:0];
    CGFloat start = firstAxisValue.scalar;
    CGFloat scalarOriginOffet = scalar - start;
    
    CGFloat result = viewHeight - (((scalarOriginOffet * axisLengthYPx) / modelLengthY) + offsetAxisYPx);
    return result;
}


- (CGFloat)getPXPositionForXAxisScalar:(CGFloat)scalar graph:(EGMGraphView *)graph modelLengthX:(CGFloat)modelLengthX {
    CGFloat axisLengthXPx = [self axisLengthWithoutPadding];
    
    CGFloat offsetAxisXPx = [self getOrigin].x + [self axisStartPaddingPx];
    
    EGMGraphAxisValue *firstAxisValue = [self.axisValues objectAtIndex:0];
    CGFloat start = firstAxisValue.scalar;
    CGFloat scalarOriginOffet = scalar - start;
    
    CGFloat result = ((scalarOriginOffet * axisLengthXPx) / modelLengthX) + offsetAxisXPx;
    
    return result;
}

- (void)setLineRenderer_:(EGMGraphLineRenderer *)renderer {
    self.lineRenderer = renderer;
}



@end
