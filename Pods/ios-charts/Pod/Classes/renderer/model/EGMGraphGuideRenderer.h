//
//  EGMGraphGuideRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"

@interface EGMGraphGuideRenderer : EGMGraphItemRenderer

@property (nonatomic, assign) CGPoint p1;
@property (nonatomic, assign) CGPoint p2;

- (instancetype)initWithP1:(CGPoint)p1 p2:(CGPoint)p2 color:(UIColor *)color;

@end
