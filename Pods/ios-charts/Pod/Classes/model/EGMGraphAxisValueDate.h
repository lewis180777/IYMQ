//
//  EGMGraphAxisValue.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGMGraphAxisValue.h"

@interface EGMGraphAxisValueDate : EGMGraphAxisValue

@property (nonatomic, strong) NSDate *date;

- (instancetype)initWithDate: (NSDate *)date formatter: (NSDateFormatter *) formatter;

@end