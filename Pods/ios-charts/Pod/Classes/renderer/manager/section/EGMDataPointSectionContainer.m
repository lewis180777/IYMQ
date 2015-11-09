//
//  EGMDataPointSection.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMDataPointSectionContainer.h"
#import "EGMGraphDataPoint.h"

@interface EGMDataPointSectionContainer()

@property (nonatomic, strong) NSMutableArray *sections;

@end

@implementation EGMDataPointSectionContainer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addDataPoint:(EGMGraphDataPoint *)dataPoint toSection:(NSInteger)section {
    
    [self expandBoundsIfNecessaryForIndex:section];
    
    NSMutableArray *sectionDataPoints = [self.sections objectAtIndex:section];
    if (!sectionDataPoints) {
        sectionDataPoints = [[NSMutableArray alloc] init];
        [self.sections insertObject:sectionDataPoints atIndex:section];
    }
    [sectionDataPoints addObject:dataPoint];
}

- (void)expandBoundsIfNecessaryForIndex:(NSInteger)index {
    if (self.sections.count < index) {
        for (NSInteger i = (NSInteger)self.sections.count; i < index; i++) {
            [self.sections addObject:[[NSMutableArray alloc] init]];
        }
    }
}

- (NSArray *)dataPointsForSection:(NSInteger)section {
    return [self.sections objectAtIndex:section];
}

- (NSArray *)allDataPoints {
    NSMutableArray *dataPoints = [[NSMutableArray alloc] init];
    for (NSArray *section in self.sections) {
        [dataPoints addObjectsFromArray:section];
    }
    return dataPoints;
}

@end
