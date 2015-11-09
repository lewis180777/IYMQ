//
//  EGMGraphItemRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"
#import "EGMGraphView.h"

@implementation EGMGraphItemRenderer


//Default implementation
//TODO rename touchesInGraphEnded, as touch is not in the item is in the graph
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:graph];
    if ([self touchAreaContains:location]) {
        [self touchesEnded:location graph:graph]; //maybe it makes sense to convert here (?) to local coords, for now pass graph coords
        //local coords maybe are not useful if we use big touch areas that dont match the shape e.g. for a line
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:graph];
    if ([self touchAreaContains:location]) {
        [self touchesMoved:location graph:graph]; //maybe it makes sense to convert here (?) to local coords, for now pass graph coords
        //local coords maybe are not useful if we use big touch areas that dont match the shape e.g. for a line
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:graph];
    if ([self touchAreaContains:location]) {
        [self touchesBegan:location graph:graph]; //maybe it makes sense to convert here (?) to local coords, for now pass graph coords
        //local coords maybe are not useful if we use big touch areas that dont match the shape e.g. for a line
    }
}


/**
 Override this e.g. to increase touch area
 */
- (BOOL)touchAreaContains:(CGPoint)pointPx {
    return [self contains:pointPx];
}

- (BOOL)contains:(CGPoint)pointPx {
    return NO;
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {}

- (void)onAddOverlays:(UIView *)graph {}

- (void)touchesBegan:(CGPoint)touchPoint graph:(EGMGraphView *)graph {
    if (self.touchesBeganBlock) {
        self.touchesBeganBlock(graph);
    }
}

- (void)touchesEnded:(CGPoint)touchPoint graph:(EGMGraphView *)graph {
    if (self.touchesEndedBlock) {
        self.touchesEndedBlock(graph);
    }
}

- (void)touchesMoved:(CGPoint)touchPoint graph:(EGMGraphView *)graph {
    if (self.touchesMovedBlock) {
        self.touchesMovedBlock(graph);
    }
}


- (void)addOffset:(CGPoint)offset {
    self.pointPx = CGPointMake(self.pointPx.x + offset.x, self.pointPx.y + offset.y);
}

- (CGRect)getRect {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

- (void)setRect:(CGRect)rect {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}
- (void)clearTouch:(EGMGraphView *)graph {
    
}

- (void)cleanup {
    if (self.cleanupBlock) {
        self.cleanupBlock();
    }
}

@end
