//
//  EGMGraph.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 12/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphView.h"
#import "EGMGraphDataPoint.h"
#import "EGMGraphAxisValue.h"
#import "EGMGraphUtils.h"
#import "EGMGraphDataPointRectTextRenderer.h"
#import "EGMGraphAxisValueNumber.h"
#import "EGMGraphAxisLabel.h"

@interface EGMGraphView()

@end


@implementation EGMGraphView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.spacingLabelAxisX = 0;
        self.spacingLabelAxisY = 0;
        self.verticalAxisXLabels = YES;

        self.dividerLength = 0;
        self.addPaddingToFit = NO;
        
        self.centerX = YES;
        
        self.addPaddingSegmentIfEdge = YES;
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


- (void)configure {
    
    //generate axis values if not set explicitly
    if (!self.axisValuesX) {
        self.axisValuesX = [EGMGraphAxisRenderer generateXAxisValuesWithDataPointsNew:self.dataPoints segmentCount:self.segmentCount multiple:self.segmentSizeMult axisValueGenerator:self.axisXValueGenerator];
    }
    if (!self.axisValuesY) {
        self.axisValuesY = [EGMGraphAxisRenderer generateYAxisValuesWithDataPointsNew:self.dataPoints minSegmentCount:self.minSegmentCountY maxSegmentCount:self.maxSegmentCountY multiple:self.segmentSizeMultY axisValueGenerator:self.axisYValueGenerator addPaddingSegmentIfEdge:self.addPaddingSegmentIfEdge];
    }
    
    //init axis
    //x
    self.xAxisRenderer = [[EGMGraphAxisRenderer alloc] init];
    self.xAxisRenderer.labelManager = [[EGMGraphLabelManager alloc] init];
    self.xAxisRenderer.dividersManager = [[EGMGraphLineManager alloc] init];
    [self.xAxisRenderer setLineRenderer_:[[EGMGraphLineRenderer alloc] init]];
    
    //y
    self.yAxisRenderer = [[EGMGraphAxisRenderer alloc] init];
    self.yAxisRenderer.labelManager = [[EGMGraphLabelManager alloc] init];
    self.yAxisRenderer.dividersManager = [[EGMGraphLineManager alloc] init];
    [self.yAxisRenderer setLineRenderer_:[[EGMGraphLineRenderer alloc] init]];
    
    EGMGraphAxisLabel *firstAxisLabel = [self.definitionYLabels firstObject];
    CGFloat axisYLabelHeight = self.definitionYLabels && self.definitionYLabels.count ? [self getRenderedTextSize:firstAxisLabel.text fontAttributes:[EGMGraphUtils getLabelStringAttributesForFont:self.labelsFont color:self.labelsFontColor]].height : 0;
    
    NSDictionary *fontAttributes = [EGMGraphUtils getLabelStringAttributesForFont:self.labelsFont color:self.labelsFontColor];
    CGFloat maxXLabelHeight = [EGMGraphUtils getMaxLabelHeight:self.axisValuesX fontAttributes:fontAttributes verticalLabels:self.verticalAxisXLabels spacing:self.spacingLabelBetweenAxis];
    CGFloat maxYLabelWidth = [EGMGraphUtils getMaxLabelWidth:self.axisValuesY fontAttributes:fontAttributes verticalLabels:NO];
    CGFloat originX = self.paddingLeft + maxYLabelWidth + self.spacingLabelAxisY;
    
    
    // fixed pixel segment height - recalculate frame
    CGFloat frameHeight;
    if (self.segmentSizePxY) {
        frameHeight = (self.axisValuesY.count * self.segmentSizePxY) + self.paddingBottom + self.paddingTop + self.spacingLabelAxisX + maxXLabelHeight + (self.dividerLength / 2);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, frameHeight);
        self.resizeBlock(self.frame.size);
    } else {
        frameHeight = self.frame.size.height;
    }
    CGFloat originY = self.frame.size.height - maxXLabelHeight - self.spacingLabelAxisX - self.paddingBottom - (self.dividerLength / 2);
    
    
    
    CGPoint origin = CGPointMake(originX, originY);
    CGPoint yP2 = CGPointMake(originX, self.paddingTop + axisYLabelHeight);

    NSDictionary *labelsFontAttributes = @{NSFontAttributeName: self.labelsFont, NSForegroundColorAttributeName: self.labelsFontColor};
    
    //calculate y first
    [self.yAxisRenderer initWithP1:origin p2:yP2 color:[UIColor blackColor] paddingFirst:0 paddingLast:0 graph:self spacingLabelsAxis:self.spacingLabelAxisY spacingLabelBetweenAxis:self.spacingLabelBetweenAxis axisValues:self.axisValuesY verticalLabels:NO verticalDefinitionLabels:NO dividerLength:self.dividerLength definitionLabels:self.definitionYLabels labelsFont:self.labelsFont labelsFontColor:self.labelsFontColor axisLabelFont:self.axisLabelsFont axisLabelFontColor:self.axisLabelsFontColor];
    
    [self onUpdatedYAxis:self.yAxisRenderer labelsFontAttributes:labelsFontAttributes solvedConflicts:NO];
}


/**
 Calculate dimensions of items in graph depending on y axis
 */
- (void)onUpdatedYAxis:(EGMGraphAxisRenderer *)yAxis labelsFontAttributes: (NSDictionary *)labelsFontAttributes solvedConflicts:(BOOL)solvedConflicts {
    CGPoint origin = CGPointMake([self.yAxisRenderer getOrigin].x, [self.yAxisRenderer getOrigin].y);
    CGPoint xP2 = CGPointMake(self.frame.size.width - self.paddingRight, origin.y);
    
    [self.xAxisRenderer initWithP1:origin p2:xP2 color:[UIColor blackColor] paddingFirst:0 paddingLast:0 graph:self spacingLabelsAxis:self.spacingLabelAxisX spacingLabelBetweenAxis:self.spacingLabelBetweenAxis axisValues:self.axisValuesX verticalLabels:self.verticalAxisXLabels verticalDefinitionLabels:self.verticalAxisXDefinitionLabels dividerLength:self.dividerLength definitionLabels:self.definitionXLabels labelsFont:self.labelsFont labelsFontColor:self.labelsFontColor axisLabelFont:self.axisLabelsFont axisLabelFontColor:self.axisLabelsFontColor];
    
    //guides
    [self initGuidesX:self.xAxisRenderer yAxis:self.yAxisRenderer];
    [self initGuidesY:self.xAxisRenderer yAxis:self.yAxisRenderer];
    
    //datapoints
    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        NSArray *dataPointsRenderers = [dataPointsManager generateDataPointRenderers:dataPointsManager.dataPoints xAxis:self.xAxisRenderer yAxis:self.yAxisRenderer xAxisValues:self.axisValuesX yAxisValues:self.axisValuesY graph:self];
        
        dataPointsManager.itemsRenderers = dataPointsRenderers;
    }

    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        [dataPointsManager onAddOverlays:self];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        [dataPointsManager touchesMoved:touches withEvent:event graph:self];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        [dataPointsManager touchesMoved:touches withEvent:event graph:self];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        [dataPointsManager touchesEnded:touches withEvent:event graph:self];
    }
    [self.xAxisRenderer touchesEnded:touches withEvent:event graph:self];
}

- (CGSize)getRenderedTextSize:(NSString *)text fontAttributes:(NSDictionary *)fontAttributes {
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:fontAttributes];
    return [attrStr size];
}



- (void)initGuidesX:(EGMGraphAxisRenderer *)xAxis yAxis:(EGMGraphAxisRenderer *)yAxis {
    [self.guidesManagerX cleanup];
    
    NSArray *points = [xAxis getDividersFixedCoordPositions];
    
    for (NSNumber *point in points) {
        CGPoint origin = [xAxis getOrigin];
        
        CGFloat gX1 = [point doubleValue];
        CGFloat gY1 = origin.y - [yAxis length];
        CGFloat gX2 = gX1;
        CGFloat gY2 = origin.y;
        
        EGMGraphGuideRenderer *guideRenderer = [[EGMGraphGuideRenderer alloc] initWithP1:CGPointMake(gX1, gY1) p2:CGPointMake(gX2, gY2) color:self.guideLinesColor];
        [self.guidesManagerX addGuide:guideRenderer];
    }
}


- (void)initGuidesY:(EGMGraphAxisRenderer *)xAxis yAxis:(EGMGraphAxisRenderer *)yAxis {
    [self.guidesManagerY cleanup];
    
    NSArray *points = [yAxis getDividersFixedCoordPositions];

    for (NSNumber *point in points) {
        CGPoint origin = [yAxis getOrigin];
        
        CGFloat gX1 = origin.x;
        CGFloat gY1 = [point doubleValue];
        CGFloat gX2 = [xAxis length] + [yAxis getOrigin].x;
        CGFloat gY2 = gY1;
        
        EGMGraphGuideRenderer *guideRenderer = [[EGMGraphGuideRenderer alloc] initWithP1:CGPointMake(gX1, gY1) p2:CGPointMake(gX2, gY2) color:self.guideLinesColor];
        [self.guidesManagerY addGuide:guideRenderer];
    }
}

/**
 Use this method to add layers or views on top of the chart
 */
- (void)drawOverlays {
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.xAxisRenderer onRender:context graph:self];
    [self.yAxisRenderer onRender:context graph:self];
    
    [self.guidesManagerX onRender:context graph:self];
    [self.guidesManagerY onRender:context graph:self];
    
    for (EGMGraphDataPointsManager *dataPointsManager in self.dataPointsManagers) {
        [dataPointsManager onRender:context graph:self];
    }
}

@end
