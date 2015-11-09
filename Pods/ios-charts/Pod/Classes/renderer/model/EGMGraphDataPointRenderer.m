//
//  EGMGraphDataPointRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRenderer.h"

@implementation EGMGraphDataPointRenderer


- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint{
    self = [super init];
    if (self) {
        self.pointPx = pointPx;
        self.dataPoint = dataPoint;
    }
    return self;
}


- (void)touchesEnded:(CGPoint)touchPoint {
    
}

- (void)setOrigin:(CGPoint)point {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}
- (CGRect)getRect {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

//- (void)setRect:(CGRect)rect {
//    @throw [NSException exceptionWithName:NSInternalInconsistencyException
//                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
//                                 userInfo:nil];
//}

- (void)setItemAlignement:(NSInteger)itemAlignement {
}


@end