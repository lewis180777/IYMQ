//
//  Utils.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 22/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphUtils.h"
#import "EGMGraphAxisValue.h"
#import "EGMGraphView.h"
#import "EGMGraphAxisLabel.h"

@implementation EGMGraphUtils

+ (CGFloat)getModelAxisLengthX:(NSArray *)axisValuesX {
    
    if (!axisValuesX || axisValuesX.count == 0) {
        return 0;
    }
    
    EGMGraphAxisValue *firstAxisValue = [axisValuesX objectAtIndex:0];
    EGMGraphAxisValue *lastAxisValue = [axisValuesX objectAtIndex:(axisValuesX.count - 1)];
    
    return lastAxisValue.scalar - firstAxisValue.scalar;
}

+ (CGFloat)getModelAxisLengthY:(NSArray *)axisValuesY {
    
    if (!axisValuesY || axisValuesY.count == 0) {
        return 0;
    }
    
    EGMGraphAxisValue *firstAxisValue = [axisValuesY objectAtIndex:0];
    EGMGraphAxisValue *lastAxisValue = [axisValuesY objectAtIndex:(axisValuesY.count - 1)];
    
    return lastAxisValue.scalar - firstAxisValue.scalar;
}

+ (CGFloat)getPXPositionForYAxisScalar:(CGFloat)scalar yAxis:(EGMGraphAxisRenderer *)yAxis yAxisValues:(NSArray *)yAxisValues graph:(EGMGraphView *)graph {
    CGFloat axisLengthYPx = yAxis.length;
    CGFloat modelLengthY = [self getModelAxisLengthY: yAxisValues];
    
    NSInteger viewHeight = graph.bounds.size.height;
    
    CGFloat offsetAxisYPx = viewHeight - [yAxis getOrigin].y;
    
    EGMGraphAxisValue *firstAxisValue = [yAxisValues objectAtIndex:0];
    CGFloat start = firstAxisValue.scalar;
    CGFloat scalarOriginOffet = scalar - start;
    
    CGFloat result = viewHeight - (((scalarOriginOffet * axisLengthYPx) / modelLengthY) + offsetAxisYPx);
    return result;
}

+ (CGFloat)getPXPositionForXAxisScalar:(CGFloat)scalar xAxis:(EGMGraphAxisRenderer *)xAxis xAxisValues:(NSArray *)xAxisValues graph:(EGMGraphView *)graph {
    CGFloat axisLengthXPx = xAxis.length;
    CGFloat modelLengthX = [self getModelAxisLengthX:xAxisValues];
    CGFloat offsetAxisXPx = [xAxis getOrigin].x;
    
    EGMGraphAxisValue *firstAxisValue = [xAxisValues objectAtIndex:0];
    CGFloat start = firstAxisValue.scalar;
    CGFloat scalarOriginOffet = scalar - start;
    
    CGFloat result = ((scalarOriginOffet * axisLengthXPx) / modelLengthX) + offsetAxisXPx;
    
    return result;
}

+ (CGRect)intersection:(CGRect)r1 r2:(CGRect)r2 {
    if (CGRectIntersectsRect(r1, r2)) {
        CGFloat x1, x2, y1, y2;
        x1 = MAX(r1.origin.x, r2.origin.x);
        x2 = MIN(r1.origin.x + r1.size.width, r2.origin.x + r2.size.width);
        y1 = MAX(r1.origin.y, r2.origin.y);
        y2 = MIN(r1.origin.y + r1.size.height, r2.origin.y + r2.size.height);
        return CGRectMake(x1, y1, abs(x2 - x1), abs(y2 - y1));
        
    } else {
        return CGRectNull;
    }
}

+ (NSString *)getStringFromNumber: (CGFloat)number maxDigitsAfterDecimal:(NSInteger)maxDigitsAfterDecimal {
    NSNumberFormatter * nf = [[NSNumberFormatter alloc] init];
    [nf setMaximumFractionDigits:maxDigitsAfterDecimal];
    //    [nf setPaddingCharacter:@"0"];
    NSString *str = [nf stringFromNumber:[NSNumber numberWithFloat:number]];
    return str;
}

+ (NSDictionary *)getLabelStringAttributesForFont:(UIFont *)font color:(UIColor *)color {
    return @{NSFontAttributeName: font, NSForegroundColorAttributeName: color};
}


+ (CGSize)getRenderedTextSize:(NSString *)text fontAttributes:(NSDictionary *)fontAttributes {
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:fontAttributes];
    return [attrStr size];
}


+ (CGFloat)getMaxLabelWidth:(NSArray *)axisValues fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels {
    CGFloat maxWidth = FLT_MIN;
    for (EGMGraphAxisValue *axisValue in axisValues) {
        EGMGraphAxisLabel *axisLabel = [axisValue getFirstLabel];
        CGSize labelSize = [self getRenderedTextSize:axisLabel.text fontAttributes:fontAttributes];
        CGFloat width;
        if (verticalLabels) { //label is rotated - use width as height
            width = labelSize.height;
        } else {
            width = labelSize.width;
        }
        if (width > maxWidth) {
            maxWidth = labelSize.width;
        }
    }
    return maxWidth;
}

+ (NSArray *)axisLabelstoStringsArray:(NSArray *)axisLabels {
    NSMutableArray *stringArray = [NSMutableArray array];
    for (EGMGraphAxisLabel *axisLabel in axisLabels) {
        [stringArray addObject:axisLabel.text];
    }
    return stringArray;
}

+ (CGFloat)getMaxLabelHeight:(NSArray *)axisValues fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels spacing:(CGFloat)spacing {
    CGFloat maxHeight = FLT_MIN;
    for (EGMGraphAxisValue *axisValue in axisValues) {
        
        // TODO review this and the names/functionality of getMaxLabelWidth/getMaxLabelHeight, there's something weird - is it consistent, is naming correct, shouldnt we use getRenderedTextSizeForVerticalStringArray or equivalent for both, maybe we can use only one generic method, etc?
        // for now this is used because we assume we are calculating height of x-axis labels here
        
        NSArray *axisStringsArray = [self axisLabelstoStringsArray: axisValue.labels];
        
        CGSize labelSize = [self getRenderedTextSizeForVerticalStringArray:axisStringsArray fontAttributes:fontAttributes spacing:spacing];
        
        CGFloat height;
        if (verticalLabels) { //label is rotated - use width as height
            height = labelSize.width;
        } else {
            height = labelSize.height;
        }
        if (height > maxHeight) {
            maxHeight = height;
        }
    }
    return maxHeight;
}

+ (CGFloat)getMaxLabelHeightForStrings:(NSArray *)strings fontAttributes:(NSDictionary *)fontAttributes verticalLabels:(BOOL)verticalLabels {
    CGFloat maxHeight = FLT_MIN;
    for (NSString *string in strings) {
        CGSize labelSize = [self getRenderedTextSize:string fontAttributes:fontAttributes];
        
        CGFloat height;
        if (verticalLabels) { //label is rotated - use width as height
            height = labelSize.width;
        } else {
            height = labelSize.height;
        }
        if (height > maxHeight) {
            maxHeight = height;
        }
    }
    return maxHeight;
}

+ (CGSize)getRenderedTextSizeForVerticalStringArray:(NSArray *)verticalStringArray fontAttributes:(NSDictionary *)fontAttributes spacing:(CGFloat)spacing {
    CGFloat width = FLT_MIN;
    CGFloat height = 0;
    for (NSString *string in verticalStringArray) {
        CGSize stringSize = [self getRenderedTextSize:string fontAttributes:fontAttributes];
        width = MAX(width, stringSize.width);
        height += stringSize.height;
        height += spacing;
    }
    return CGSizeMake(width, height);
}


@end