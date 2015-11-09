//
//  EGMGraphLineRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 24/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLineRenderer.h"

@implementation EGMGraphLineRenderer


- (void)setP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color {
    self.p1 = p1;
    self.p2 = p2;
    self.color = color;
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
    if (!self.hidden) { //TODO generic - do check in superclass
        CGContextSetStrokeColorWithColor(context, self.color.CGColor);
        CGContextMoveToPoint(context, self.p1.x, self.p1.y);
        CGContextAddLineToPoint(context, self.p2.x, self.p2.y);
        CGContextStrokePath(context);
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    
}

- (BOOL)isHorizontal {
    return self.p2.x - self.p1.x == 0;
}


/**
 Returns length of axis
 expects vertical or horizontal axis, otherwise exception
 */
- (CGFloat)length {
    if ([self isHorizontal]) {
        return abs(self.p2.y - self.p1.y);
    } else if (self.p2.y - self.p1.y == 0) {
        return abs(self.p2.x - self.p1.x);
    } else {
        NSLog(@"Error: Invalid axis");
        return -1;
    }
}

- (CGFloat)getFixedCoord {
    if ([self isHorizontal]) {
        return self.p1.x;
    } else {
        return self.p1.y;
    }
}

- (void)addOffset:(CGPoint)offset {
    self.p1 = CGPointMake(self.p1.x + offset.x, self.p1.y + offset.y);
    self.p2 = CGPointMake(self.p2.x + offset.x, self.p2.y + offset.y);
}

- (CGRect)getRect {
    return CGRectMake(self.p1.x, self.p1.y, 1, [self length]);
}


@end
