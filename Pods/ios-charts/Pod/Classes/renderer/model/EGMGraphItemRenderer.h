//
//  EGMGraphItemRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EGMGraphView;

@interface EGMGraphItemRenderer : NSObject

@property (nonatomic, assign) BOOL hidden; //TODO create method onRenderVisible, onAddOverlays visible to be overriden by subclass

//pixel coordinates of datapoint in graph
@property (nonatomic, assign) CGPoint pointPx;

// optional
@property (nonatomic, copy) void (^touchesEndedBlock)(EGMGraphView *);
@property (nonatomic, copy) void (^touchesBeganBlock)(EGMGraphView *);
@property (nonatomic, copy) void (^touchesMovedBlock)(EGMGraphView *);
@property (nonatomic, copy) void (^cleanupBlock)();

// here is where we add views to the graph
- (void)onAddOverlays:(EGMGraphView *)graph;

// Use this to render directly in graph's view context
// Note that items rendered with this method, no matter in which manager/order, will always be behind views added with onAddOverlays
- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event graph:(EGMGraphView *)graph;

- (BOOL)contains:(CGPoint)pointPx;
- (BOOL)touchAreaContains:(CGPoint)pointPx;
- (void)clearTouch:(EGMGraphView *)graph;
- (CGRect)getRect;

- (void)addOffset:(CGPoint)offset;

- (void)cleanup;




@end