//
//  EGMGraphDataPoint.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 20/08/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGMGraphAxisValue.h"
#import "EGMGraphDataPoint.h"

@interface EGMGraphDataPoint : NSObject

/**
 Object from domain model this datapoint represents
 can be nil - set only if we need to get it back in e.g. generators
 */
@property (nonatomic, strong) NSObject *wrappedObject;


- (EGMGraphAxisValue *) getXValue;
- (EGMGraphAxisValue *) getYValue;

- (instancetype)initWithX: (EGMGraphAxisValue *) x y:(EGMGraphAxisValue *)y;


- (NSString *)getText;

/**
 Detailed description, can be used e.g. to show an info box when we tap on the datapoint
 */
- (NSString *)getInfoText;

- (EGMGraphDataPoint *)clone;

@end