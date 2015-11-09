//
//  EGMDataPointSection.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EGMGraphDataPoint;

@interface EGMDataPointSectionContainer : NSObject

- (void)addDataPoint:(EGMGraphDataPoint *)dataPoint toSection:(NSInteger)section;

- (NSArray *)dataPointsForSection:(NSInteger)section;

- (NSArray *)allDataPoints;

@end
