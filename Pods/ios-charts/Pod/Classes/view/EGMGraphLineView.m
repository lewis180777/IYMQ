//
//  EGMGraphLineView.m
//  newgraph
//
//  Created by Ivan Schuetz on 04/10/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLineView.h"

@interface EGMGraphLineView()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) CGFloat animDelay;

@end

@implementation EGMGraphLineView

- (instancetype)initWithPoints:(NSArray *)points frame:(CGRect)frame lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration area:(BOOL)area animDelay:(CGFloat)animDelay {
    self = [super initWithFrame:frame];
    if (self) {
        self.lineColor = lineColor;
        self.animDuration = animDuration;
        self.animDelay = animDelay;
        
        UIBezierPath *path;
        if (area) {
            path = [self generateAreaPathForPoints:points frame:frame];
            self.lineView = [self generateAreaForPath:path frame:frame];
        } else {
            path = [self generatePathForPoints:points frame:frame];
            self.lineView = [self generateLineForPath:path frame:frame];
        }

        [self addSubview:self.lineView];
    }
    return self;
}


- (CALayer *)createLineMask:(CGRect)frame {
    CAShapeLayer *lineMaskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = frame;
    maskRect.origin.y = 0;
    maskRect.size.height = frame.size.height;
    CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
    
    lineMaskLayer.path = path;
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    return lineMaskLayer;
}

- (UIBezierPath *)generateAreaPathForPoints:(NSArray *)points frame:(CGRect)frame {
    UIGraphicsBeginImageContext(frame.size);
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapRound];
    [progressline setLineJoinStyle:kCGLineJoinRound];
    
    if (points.count && points.count > 0) {
        CGPoint p = [points[0] CGPointValue];
        [progressline moveToPoint:p];
    }
    
    for (int i = 1; i < points.count; i++) {
        CGPoint p = [points[i] CGPointValue];
        [progressline addLineToPoint:p];
    }
    
    [progressline closePath];
    
//    UIGraphicsEndImageContext();
    
    return progressline;
}


- (UIBezierPath *)generatePathForPoints:(NSArray *)points frame:(CGRect)frame {
    UIGraphicsBeginImageContext(frame.size);
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapRound];
    [progressline setLineJoinStyle:kCGLineJoinRound];
    
    for (int i = 0; i < points.count - 1; i++) {
        CGPoint p1 = [points[i] CGPointValue];
        CGPoint p2 = [points[i + 1] CGPointValue];

        [progressline moveToPoint:p1];
        [progressline addLineToPoint:p2];
    }
    
    [progressline closePath];

    UIGraphicsEndImageContext();
    
    return progressline;
}

- (UIView *)generateLineView:(CGRect)frame {
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor clearColor];
    
    CGRect lineViewFrame = frame;
    lineViewFrame.origin = CGPointMake(0, 0);
    lineView.frame = lineViewFrame;
    
    CALayer *lineMask = [self createLineMask:frame];
    lineView.layer.mask = lineMask;
    
    return lineView;
}

- (UIView *)generateLineForPath:(UIBezierPath *)path frame:(CGRect)frame {
    UIView *lineView = [self generateLineView:frame];
    
    CAShapeLayer * lineLayer = [CAShapeLayer layer];
    lineLayer.lineJoin = kCALineJoinBevel;
    lineLayer.fillColor   = [[UIColor blackColor] CGColor];
    lineLayer.lineWidth   = 1.0;
    lineLayer.strokeEnd   = 0.0;
    [lineView.layer addSublayer:lineLayer];
    
    lineLayer.path = path.CGPath;
    lineLayer.strokeColor = self.lineColor.CGColor;
    
    

    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = self.animDuration;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    
    pathAnimation.beginTime = CACurrentMediaTime() + self.animDelay;
    [lineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    return lineView;
}


- (UIView *)generateAreaForPath:(UIBezierPath *)path frame:(CGRect)frame {
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor clearColor];
    
    CGRect lineViewFrame = frame;
    lineViewFrame.origin = CGPointMake(0, 0);
    lineView.frame = lineViewFrame;
    
    CAShapeLayer * lineLayer = [CAShapeLayer layer];
    lineLayer.lineJoin = kCALineJoinBevel;
    lineLayer.fillColor   = [self.lineColor CGColor];
    
    lineLayer.lineWidth   = 2.0;
    lineLayer.strokeEnd   = 0.0;

    [lineView.layer addSublayer:lineLayer];
    
    lineLayer.path = path.CGPath;
    lineLayer.strokeColor = self.lineColor.CGColor;
    
    CAGradientLayer *maskLayer = [CAGradientLayer layer];
    maskLayer.anchorPoint = CGPointZero;

    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [maskLayer setColors:colors];
    maskLayer.bounds = CGRectMake(0, 0, 0, lineView.layer.bounds.size.height);

    // Start the gradient at the bottom and go almost half way up.
    [maskLayer setStartPoint:CGPointMake(1.0f, 0.0f)];
    [maskLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    
    
    lineView.layer.mask = maskLayer;

    CABasicAnimation* revealAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    revealAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, lineView.layer.bounds.size.height)];
    
    CGRect target = CGRectMake(lineView.layer.bounds.origin.x, lineView.layer.bounds.origin.y, lineView.layer.bounds.size.width + 2000, lineView.layer.bounds.size.height);

    revealAnimation.toValue = [NSValue valueWithCGRect:target];
    revealAnimation.duration = self.animDuration;
    
    revealAnimation.removedOnCompletion = NO;
    revealAnimation.fillMode = kCAFillModeForwards;
    
    revealAnimation.beginTime = CACurrentMediaTime() + self.animDelay;
    [lineView.layer.mask addAnimation:revealAnimation forKey:@"revealAnimation"];

    return lineView;
}


@end
