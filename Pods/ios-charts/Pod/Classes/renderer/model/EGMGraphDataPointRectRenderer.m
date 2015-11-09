//
//  EGMGraphDataPointRectRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRectRenderer.h"
#import "EGMGraphView.h"


@interface EGMGraphDataPointRectRenderer()

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIView *rectView;

@end

@implementation EGMGraphDataPointRectRenderer


- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    
    self = [super initWithPointPx:pointPx dataPoint:dataPoint];
    if (self) {
        self.rectSize = size;
        self.color = color;
        self.cornerRadius = cornerRadius;
        self.pointPx = pointPx;
    }
    return self;
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
//    CGRect rectangle = [self getRect];
//    CGContextSetFillColorWithColor(context, self.color.CGColor);
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rectangle cornerRadius:self.cornerRadius];
//    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
//    [bezierPath fill];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    self.rectView = [[UILabel alloc] initWithFrame:self.rect];
    self.rectView.layer.cornerRadius = self.cornerRadius;
    self.rectView.layer.backgroundColor = self.color.CGColor;
    [graph addSubview: self.rectView];
}

- (BOOL)contains:(CGPoint)pointPx {
    return CGRectContainsPoint([self getRect], pointPx);
}

- (void)setOrigin:(CGPoint)point {
    [self setPointPx:CGPointMake(
                                 point.x + (self.rectSize.width / 2),
                                 point.y + (self.rectSize.height / 2))];
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.rectView.layer.backgroundColor = color.CGColor;
}

- (CGRect)getRect {
    return _rect;
}

- (void)cleanup {
    [self.rectView removeFromSuperview];
}

- (void)setPointPx:(CGPoint)pointPx {
    [super setPointPx:pointPx];
    [self updateRect];
}

- (void)setRectSize:(CGSize)rectSize {
    _rectSize = rectSize;
    [self updateRect];
}

- (void)updateRect {
    CGFloat dataPointRectX = self.pointPx.x - (self.rectSize.width / 2);
    CGFloat dataPointRectY = self.pointPx.y - (self.rectSize.height / 2);
    CGRect rect = CGRectMake(dataPointRectX, dataPointRectY, self.rectSize.width, self.rectSize.height);
    self.rect = rect;
}


@end
