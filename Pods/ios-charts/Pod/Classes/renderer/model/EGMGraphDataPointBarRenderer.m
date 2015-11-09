//
//  EGMGraphDataPointBarRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointBarRenderer.h"
#import "EGMGraphView.h"

@interface EGMGraphDataPointBarRenderer()
@property (nonatomic, strong) UIView *barView;

@property (nonatomic, assign) CGRect rect;
@end

@implementation EGMGraphDataPointBarRenderer

//TODO pass either only point or rect
- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rect:(CGRect)rect {
    self = [super initWithPointPx:pointPx dataPoint:dataPoint];
    if (self) {
        self.rect = rect;
    }
    return self;
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    self.barView = [[UIView alloc] initWithFrame:CGRectMake(self.rect.origin.x, self.rect.origin.y + self.rect.size.height, self.rect.size.width, 0)];
    
    self.barView.backgroundColor = [UIColor blueColor];
    
    [graph addSubview:self.barView];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.barView.frame = CGRectMake(self.rect.origin.x, self.rect.origin.y + self.rect.size.height, self.rect.size.width, -self.rect.size.height);

                     }
                     completion:nil];
}

//gets bar for point which is at top, horizontally centered
//TODO put this in the constructor no static method
+ (CGRect)getRectForPoint:(CGPoint)point barWidth:(CGFloat)barWidth origin:(CGPoint)origin axis:(NSInteger)axis {
    CGFloat barWidthHalf = barWidth / 2;
    CGFloat barHeight = origin.y - point.y;
    
    return CGRectMake(point.x - barWidthHalf, point.y, barWidth, barHeight);
}

- (BOOL)contains:(CGPoint)pointPx {
    return CGRectContainsPoint(self.rect, pointPx);
}

- (void)cleanup {
    [self.barView removeFromSuperview];
}

- (void)addOffset:(CGPoint)offset {
    self.rect = CGRectMake(self.rect.origin.x + offset.x, self.rect.origin.y + offset.y, self.rect.size.width, self.rect.size.height);
}

- (CGRect)getRect {
    return self.rect;
}
@end
