//
//  EGMGraphAxisValueNumber.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGMGraphAxisValue.h"

@interface EGMGraphAxisValueNumber : EGMGraphAxisValue

- (instancetype)initWithNumber:(CGFloat)number;

- (instancetype)initWithNumber:(CGFloat)number decimals:(NSInteger)decimals;

@end
