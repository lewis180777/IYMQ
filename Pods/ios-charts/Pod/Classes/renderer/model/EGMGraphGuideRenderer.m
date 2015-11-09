//
//  EGMGraphGuideRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphGuideRenderer.h"

CGFloat const guidelineStrokeWidth = 1.0;

@interface EGMGraphGuideRenderer()

@property (nonatomic, strong) UIColor *color;

@end

@implementation EGMGraphGuideRenderer

- (instancetype)initWithP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color {
    self = [super init];
    if (self) {
        self.p1 = p1;
        self.p2 = p2;
        self.color = color;
    }
    return self;
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {

    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetLineWidth(context, guidelineStrokeWidth);
    
    CGFloat dotWidth = 2;
    CGFloat dotSpacing = 2;
    
    CGFloat offset = dotWidth + dotSpacing;
    
    CGFloat offsetY = (self.p2.y - self.p1.y);
    BOOL yConstant = offsetY == 0;
    CGFloat limit;
    CGFloat start;
    
    if (yConstant) { //horizontal line
        limit = self.p2.x - self.p1.x;
        start = self.p1.x;
        
    } else { //vertical line
        limit = self.p2.y - self.p1.y;
        start = self.p1.y;
    }
    
    limit += start;

    
    for (int tmp = start; tmp <= limit; tmp += offset) {
        
        CGFloat x1;
        CGFloat y1;
        CGFloat x2;
        CGFloat y2;
        
        if (yConstant) { //horizontal line
            x1 = tmp;
            y1 = self.p1.y;
            x2 = x1 + dotWidth;
            y2 = y1;
            
        } else { //vertical line
            x1 = self.p1.x;
            y1 = tmp;
            x2 = x1;
            y2 = y1 + dotWidth;
        }
        
        CGContextMoveToPoint(context, x1, y1);
        CGContextAddLineToPoint(context, x2, y2);
        CGContextStrokePath(context);
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    
}

- (void)addOffset:(CGPoint)offset {
    self.p1 = CGPointMake(self.p1.x + offset.x, self.p1.y + offset.y);
    self.p2 = CGPointMake(self.p2.x + offset.x, self.p2.y + offset.y);
}

@end
