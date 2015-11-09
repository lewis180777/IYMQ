//
//  EGMGraphDataPointTargetingRenderer.m
//  newgraph
//
//  Created by Ivan Schuetz on 03/10/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointTargetingRenderer.h"
#import "EGMGraphView.h"

@interface EGMGraphDataPointTargetingRenderer()

@property (nonatomic, strong)  UIView *lineHorizontal;
@property (nonatomic, strong) UIView *lineVertical;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) CGFloat animDelay;

@end

@implementation EGMGraphDataPointTargetingRenderer

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint animDuration:(CGFloat)animDuration animDelay:(CGFloat)animDelay {
    self = [super initWithPointPx:pointPx dataPoint:dataPoint];
    if (self) {
        self.animDuration = animDuration;
        self.animDelay = animDelay;
    }
    return self;
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    
    CGFloat lineWidth = 1;
    CGFloat lineWidthHalf = lineWidth / 2;
    
    CGFloat axisOriginX = [graph.xAxisRenderer getOrigin].x;
    CGFloat axisOriginY = [graph.xAxisRenderer getOrigin].y;
    CGFloat axisLengthX = self.pointPx.x - axisOriginX;
    CGFloat axisLengthY = [graph.yAxisRenderer length];
    
    UIView *lineHorizontal = [[UIView alloc] initWithFrame:CGRectMake(axisOriginX, axisOriginY, axisLengthX, lineWidth)];
    UIView *lineVertical = [[UIView alloc] initWithFrame:CGRectMake(axisOriginX, axisOriginY - axisLengthY, lineWidth, axisLengthY)];
    
    lineHorizontal.backgroundColor = [UIColor blackColor];
    lineVertical.backgroundColor = [UIColor redColor];

    [graph addSubview:lineHorizontal];
    [graph addSubview:lineVertical];
    
    [UIView animateWithDuration:self.animDuration
                          delay:self.animDelay
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         CGRect lineHorizontalFrame = lineHorizontal.frame;
                         lineHorizontalFrame = CGRectMake(lineHorizontalFrame.origin.x, self.pointPx.y - lineWidthHalf, lineHorizontalFrame.size.width, lineHorizontalFrame.size.height);
                         lineHorizontal.frame = lineHorizontalFrame;
                         
                         CGRect lineVerticalFrame = lineVertical.frame;
                         lineVerticalFrame = CGRectMake(self.pointPx.x - lineWidthHalf, lineVerticalFrame.origin.y, lineVerticalFrame.size.width, lineVerticalFrame.size.height);
                         lineVertical.frame = lineVerticalFrame;
                     }
                     completion:nil];
}


- (void)cleanup {
    [self.lineHorizontal removeFromSuperview];
    [self.lineVertical removeFromSuperview];
}

- (CGRect)getRect {
    return CGRectZero; //we don't need to solve conflicts for this now
}

@end
