//
//  EGMGraphLineRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 24/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"

@interface EGMGraphLineRenderer : EGMGraphItemRenderer

@property (nonatomic, assign) CGPoint p1;
@property (nonatomic, assign) CGPoint p2;
@property (nonatomic, strong) UIColor *color;

- (void)setP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color;

- (CGFloat)length;

- (CGFloat)getFixedCoord;

@end
