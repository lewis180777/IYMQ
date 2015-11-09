//
//  EGMGraphLabelManager.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLabelManager.h"
#import "EGMGraphAxisValue.h"

@implementation EGMGraphLabelManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.labels = [NSMutableArray array];
    }
    
    return self;
}

- (void)generateLabels:(NSArray *)axisValues {
}

- (void)addLabel:(EGMGraphLabelRenderer *)labelRenderer {
    [self.labels addObject:labelRenderer];
}


- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph {
    for (int i = 0; i < [self.labels count]; i++) {
        EGMGraphLabelRenderer *label = self.labels[i];
        [label onRender:context graph:graph];
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    for (EGMGraphLabelRenderer *label in self.labels) {
        [label touchesEnded:touches withEvent:event graph:graph];
    }
}

- (void)addOffset:(CGPoint)offset {
    for (EGMGraphLabelRenderer *label in self.labels) {
        [label addOffset:offset];
    }
}


@end
