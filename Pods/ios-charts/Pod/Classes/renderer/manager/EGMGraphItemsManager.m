//
//  EGMGraphDataPointRendererManager.m
//  newgraph
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemsManager.h"
#import "EGMGraphItemRenderer.h"


@implementation EGMGraphItemsManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delay = 0;
    }
    return self;
}

- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph {
    for (EGMGraphItemRenderer *itemsRenderer in self.itemsRenderers) {
        [itemsRenderer onRender:context graph:graph];
    }
}

/**
 Necessary for timer
 */
- (void)onAddOverlaysHelper:(NSArray *)args {
    EGMGraphItemRenderer *dataPointsRenderer = args[0];
    EGMGraphView *graph = args[1];
    NSLog(@"on addover normal single dataPointRenderer");
    
    [dataPointsRenderer onAddOverlays:graph];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    if (self.delay == 0) { //FIXME hack!! because with dispatch, even if delay is 0, managers layer order not preserved (previous comes to front)
        for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
            [dataPointsRenderer onAddOverlays:graph];
        }
    } else {
        
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, self.delay * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            for (int i = 0; i < self.itemsRenderers.count; i++) {
                EGMGraphItemRenderer *dataPointsRenderer = self.itemsRenderers[i];
                NSArray* args = [NSArray arrayWithObjects: dataPointsRenderer, graph, nil];
                [self performSelector:@selector(onAddOverlaysHelper:) withObject:args afterDelay:i * self.itemsDelay];
            }
        });
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) { //fixme quick fix, do correct solution for clearing touch
        [dataPointsRenderer clearTouch: graph];
    }
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
        [dataPointsRenderer touchesEnded:touches withEvent:event graph:graph];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) { //fixme quick fix, do correct solution for clearing touch
        [dataPointsRenderer clearTouch: graph];
    }
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
        [dataPointsRenderer touchesBegan:touches withEvent:event graph:graph];
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) { //fixme quick fix, do correct solution for clearing touch
        [dataPointsRenderer clearTouch: graph];
    }
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
        [dataPointsRenderer touchesEnded:touches withEvent:event graph:graph];
    }
}


- (void)cleanup {
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
        [dataPointsRenderer cleanup];
    }
}

- (void)addOffset:(CGPoint)offset {
    for (EGMGraphItemRenderer *dataPointsRenderer in self.itemsRenderers) {
        [dataPointsRenderer addOffset:offset];
    }
}
@end
