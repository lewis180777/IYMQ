//
//  EGMGraphGuidelineManager.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphGuidelineManager.h"

@implementation EGMGraphGuidelineManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.guides = [NSMutableArray array];
    }
    
    return self;
}

- (void)addGuide:(EGMGraphGuideRenderer *)guideRenderer {
    [self.guides addObject:guideRenderer];
}


- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph {
    for (EGMGraphGuideRenderer *guide in self.guides) {
        [guide onRender:context graph:graph];
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
}


- (void)addOffset:(CGPoint)offset {
    for (EGMGraphGuideRenderer *guide in self.guides) {
        [guide addOffset:offset];
    }
}

- (void)cleanup {
    [self.guides removeAllObjects];
}

@end
