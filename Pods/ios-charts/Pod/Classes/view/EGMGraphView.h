//
//  EGMGraph.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 12/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//
#import "EGMGraphLabelManager.h"
#import "EGMGraphLabelRenderer.h"
#import "EGMGraphGuidelineManager.h"
#import "EGMGraphGuideRenderer.h"
#import "EGMGraphDataPointRenderer.h"
#import "EGMGraphDataPointRectRenderer.h"
#import "EGMGraphDataPointBarRenderer.h"
#import "EGMGraphDataPointsManager.h"
#import "EGMGraphLineManager.h"
#import "EGMGraphAxisRenderer.h"
#import "EGMGraphLineRenderer.h"

@interface EGMGraphView : UIScrollView

@property (nonatomic, strong) NSArray *dataPoints;

@property (nonatomic, assign) CGFloat paddingLeft;
@property (nonatomic, assign) CGFloat paddingTop;
@property (nonatomic, assign) CGFloat paddingRight;
@property (nonatomic, assign) CGFloat paddingBottom;


@property (nonatomic, assign) BOOL showPaddingLabels;

@property (nonatomic, assign) BOOL addPaddingSegmentIfEdge;

@property (nonatomic, assign) BOOL centerX;

@property (nonatomic, assign) CGFloat minSpacingX;


@property (nonatomic, strong) EGMGraphGuidelineManager *guidesManagerX;
@property (nonatomic, strong) EGMGraphGuidelineManager *guidesManagerY;

@property (nonatomic, strong) NSArray *dataPointsManagers;

@property (nonatomic, copy) void(^resizeBlock)(CGSize);


@property (nonatomic, strong) EGMGraphAxisRenderer *xAxisRenderer;
@property (nonatomic, strong) EGMGraphAxisRenderer *yAxisRenderer;


@property (nonatomic, strong) NSArray *axisValuesX;
@property (nonatomic, strong) NSArray *axisValuesY;

@property (nonatomic, assign) CGFloat spacingLabelAxisX;
@property (nonatomic, assign) CGFloat spacingLabelBetweenAxis; // TODO create a wrapper for multiple labels, contains spacing, remove from here
@property (nonatomic, assign) CGFloat spacingLabelAxisY;
@property (nonatomic, assign) BOOL verticalAxisXLabels;
@property (nonatomic, assign) BOOL verticalAxisXDefinitionLabels;
@property (nonatomic, assign) CGFloat dividerLength;

@property (nonatomic, assign) NSInteger segmentCount;
@property (nonatomic, assign) CGFloat segmentSize;
@property (nonatomic, assign) CGFloat segmentSizeMult;
@property (nonatomic, assign) CGFloat minSegmentCount;
@property (nonatomic, assign) CGFloat maxSegmentCount;
@property (nonatomic, copy) EGMGraphAxisValue *(^axisXValueGenerator)(CGFloat);

@property (nonatomic, assign) NSInteger segmentCountY;
@property (nonatomic, assign) CGFloat segmentSizeY;
@property (nonatomic, assign) CGFloat segmentSizeMultY;
@property (nonatomic, assign) CGFloat minSegmentCountY;
@property (nonatomic, assign) CGFloat maxSegmentCountY;
@property (nonatomic, copy) EGMGraphAxisValue *(^axisYValueGenerator)(CGFloat);

@property (nonatomic, assign) CGFloat segmentSizePxY;


@property (nonatomic, strong) NSArray *definitionYLabels;
@property (nonatomic, strong) NSArray *definitionXLabels;

@property (nonatomic, strong) UIColor *axisLinesColor;
@property (nonatomic, strong) UIFont *labelsFont;
@property (nonatomic, strong) UIColor *labelsFontColor;
@property (nonatomic, strong) UIFont *axisLabelsFont;
@property (nonatomic, strong) UIColor *axisLabelsFontColor;



@property (nonatomic, strong) UIColor *guideLinesColor;

@property (nonatomic, assign) BOOL addPaddingToFit;

@property (nonatomic, assign) BOOL adjustStepCountToFitAfterResize;


- (void)configure;


@end
