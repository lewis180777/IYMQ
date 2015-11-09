//
//  EGMGraphDataPoint.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 20/08/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPoint.h"
#import "EGMGraphAxisValue.h"

@interface EGMGraphDataPoint()
@property (nonatomic, strong) EGMGraphAxisValue *x;
@property (nonatomic, strong) EGMGraphAxisValue *y;
@end

@implementation EGMGraphDataPoint

- (instancetype)initWithX: (EGMGraphAxisValue *) x y:(EGMGraphAxisValue *)y {
    self = [super init];
    if (self) {
        self.x = x;
        self.y = y;
    }
    return self;
}


- (EGMGraphAxisValue *) getXValue {
    return self.x;
}

- (EGMGraphAxisValue *) getYValue {
    return self.y;
}


- (NSString *)getText {
    return [NSString stringWithFormat:@"%@, %@", [self.x getFirstLabel], [self.y getFirstLabel]];
}


- (NSString *)getInfoText {
    return [NSString stringWithFormat:@"(%@, %@)", [self.x getFirstLabel], [self.y getFirstLabel]];
}

- (EGMGraphDataPoint *)clone {
    EGMGraphAxisValue *x = [self.x clone];
    EGMGraphAxisValue *y = [self.y clone];
    
    return [[EGMGraphDataPoint alloc] initWithX:x y:y];
}

@end
