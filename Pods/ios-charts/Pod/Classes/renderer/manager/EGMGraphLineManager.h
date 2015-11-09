//
//  EGMGraphLineManager.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 21/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemsManager.h"
#import "EGMGraphLineRenderer.h"

@interface EGMGraphLineManager : EGMGraphItemsManager

@property (nonatomic, assign) BOOL hideLines;
@property (nonatomic, strong) NSMutableArray *lines;

- (void)addLine:(EGMGraphLineRenderer *)lineRenderer;

- (void)addOffset:(CGPoint)offset;

- (void)setColor:(UIColor *)color;

- (NSArray *)getDividersFixedCoordPositions;

@end
