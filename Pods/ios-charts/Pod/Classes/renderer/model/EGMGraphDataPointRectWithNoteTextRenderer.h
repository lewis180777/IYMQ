//
//  EGMGraphDataPointRectWithNoteTextRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 25/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRectTextRenderer.h"

@interface EGMGraphDataPointRectWithNoteTextRenderer : EGMGraphDataPointRenderer

@property (nonatomic, assign, readonly) CGRect rect;

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor space:(CGFloat)space textFont:(UIFont *)textFont noteTextFont:(UIFont *)noteTextFont noteTextFontColor:(UIColor *)noteTextFontColor noteText:(NSString *)noteText;

@end
