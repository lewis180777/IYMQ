//
//  EGMGraphDataPointRendererManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EGMGraphView;

/**
 * Abstract class for items managers
 * An item manager manages a group of items in the graph. Item can be anything that can be displayed, guide lines, axis labels, data points, etc.
 */
@interface EGMGraphItemsManager : NSObject

@property (nonatomic, strong) NSArray *itemsRenderers;

// delay before start rendering
@property (nonatomic, assign) CGFloat delay;

// delay between rendering of items
@property (nonatomic, assign) CGFloat itemsDelay;

- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph;
- (void)onAddOverlays:(EGMGraphView *)graph;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;

- (void)addOffset:(CGPoint)offset;
- (void)cleanup;

@end
