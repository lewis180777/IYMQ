//
//  EGMGraphUtils.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGMGraphLineRenderer.h"
#import "EGMGraphAxisRenderer.h"

@interface EGMGraphUtils : NSObject

+ (CGFloat)getModelAxisLengthX:(NSArray *)axisValuesX;
+ (CGFloat)getModelAxisLengthY:(NSArray *)axisValuesY;
+ (CGFloat)getPXPositionForYAxisScalar:(CGFloat)scalar yAxis:(EGMGraphAxisRenderer *)yAxis yAxisValues:(NSArray *)yAxisValues graph:(EGMGraphView *)graph;
+ (CGFloat)getPXPositionForXAxisScalar:(CGFloat)scalar xAxis:(EGMGraphAxisRenderer *)xAxis xAxisValues:(NSArray *)xAxisValues graph:(EGMGraphView *)graph;


+ (CGRect)intersection:(CGRect)r1 r2:(CGRect)r2;

+ (NSString *)getStringFromNumber: (CGFloat)number maxDigitsAfterDecimal:(NSInteger)maxDigitsAfterDecimal;

+ (NSDictionary *)getLabelStringAttributesForFont:(UIFont *)font color:(UIColor *)color;



+ (CGSize)getRenderedTextSize:(NSString *)text fontAttributes:(NSDictionary *)fontAttributes;

+ (CGFloat)getMaxLabelWidth:(NSArray *)axisValues fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels;

+ (CGFloat)getMaxLabelHeight:(NSArray *)axisValues fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels spacing:(CGFloat)spacing;

+ (CGFloat)getMaxLabelHeightForStrings:(NSArray *)strings fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels;

+ (CGSize)getRenderedTextSizeForVerticalStringArray:(NSArray *)verticalStringArray fontAttributes:(NSDictionary *)fontAttributes spacing:(CGFloat)spacing;


@end
