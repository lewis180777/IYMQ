//
//  EGMGraphLineView.h
//  newgraph
//
//  Created by Ivan Schuetz on 04/10/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGMGraphLineView : UIView

- (instancetype)initWithPoints:(NSArray *)points frame:(CGRect)frame lineColor:(UIColor *)lineColor animDuration:(CGFloat)animDuration area:(BOOL)area animDelay:(CGFloat)animDelay;

@end
