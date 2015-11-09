//
//  EGMGraphLineManager.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 21/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLineManager.h"

@implementation EGMGraphLineManager


- (instancetype)init {
    self = [super init];
    if (self) {
        self.lines = [NSMutableArray array];
    }
    
    return self;
}

- (void)addLine:(EGMGraphLineRenderer *)guideRenderer {
    [self.lines addObject:guideRenderer];
}


- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph {
    if (!self.hideLines) {
        for (EGMGraphLineRenderer *lines in self.lines) {
            [lines onRender:context graph:graph];
        }
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
}

- (void)cleanup {
    [self.lines removeAllObjects];
}


- (void)addOffset:(CGPoint)offset {
    for (EGMGraphLineRenderer *line in self.lines) {
        [line addOffset:offset];
    }
}

- (void)setColor:(UIColor *)color {
    for (EGMGraphLineRenderer *line in self.lines) {
        line.color = color;
    }
}

- (NSArray *)getDividersFixedCoordPositions {
    NSMutableArray *arr = [NSMutableArray array];
    for (EGMGraphLineRenderer *line in self.lines) {
        CGFloat fixed = [line getFixedCoord];
        [arr addObject:[NSNumber numberWithFloat:fixed]];
    }
    return arr;
}

@end
