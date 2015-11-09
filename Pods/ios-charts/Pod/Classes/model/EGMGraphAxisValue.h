//
//  EGMGraphAxisValue.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 26/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//


@class EGMGraphAxisLabel;

@interface EGMGraphAxisValue : NSObject

@property (nonatomic, assign) BOOL isHidden;

@property (nonatomic, assign) CGFloat scalar;

// Use this to set an internal scalar different than model scalar
// The internal scalar is only used to determine the position on the graph. It's not used to determine label's text or anything else that displays information about model.
// An internal scalar is typically set when we want to position datapoints arbitrarily, for example with a predefined spacing between them.
@property (nonatomic, assign) CGFloat internalScalar;

@property (nonatomic, strong) NSArray *labels;


- (EGMGraphAxisLabel *)getFirstLabel;

- (EGMGraphAxisValue *)clone;

@end
