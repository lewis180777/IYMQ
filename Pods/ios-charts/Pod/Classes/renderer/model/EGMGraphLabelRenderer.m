//
//  EGMGraphLabelRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphLabelRenderer.h"
#import "EGMGraphView.h"

@implementation EGMGraphLabelRenderer


- (instancetype)init {
    self = [super init];
    if (self) {
        //defaults
        self.font = [UIFont fontWithName:@"Arial" size:16];
        self.fontColor = [UIColor blackColor];
        self.rotation = 0;
        self.anchor = 1;
        self.keepSameXCenterAfterRotation = YES;
    }
    return self;
}

- (void)onRender:(CGContextRef) context graph:(EGMGraphView *)graph {
    
    if (!self.hidden) {

        CGSize labelSize = [self getRenderedTextSize:self.text];
   
        CGFloat labelX = self.pointPx.x;
        CGFloat labelY = self.pointPx.y;
        CGFloat labelHalfWidth = labelSize.width / 2;
        CGFloat labelHalfHeight = labelSize.height / 2;
        
        
        
        if (self.rotation != 0) {
            
            CGContextSaveGState(context);

            CGFloat offsetX;
            if (self.keepSameXCenterAfterRotation) {
                offsetX = labelHalfWidth - labelHalfHeight;
            } else {
                offsetX = 0;
            }
            CGFloat offsetY;
            if (self.anchor == 1) {
                offsetY = labelSize.width;
            } else {
                offsetY = 0;
            }
            
            CGAffineTransform transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
            transform = CGAffineTransformTranslate(transform, labelX, labelY);
            CGFloat rotation = self.rotation * M_PI / 180;
            transform = CGAffineTransformRotate(transform, rotation);
            transform = CGAffineTransformTranslate(transform, -labelX, -labelY);

            CGContextConcatCTM(context, transform);
            
            [self drawLabelWithX:labelX y:labelY text:self.text];
            
            CGContextRestoreGState(context);
            
        } else {
            [self drawLabelWithX:labelX y:labelY text:self.text];
        }
    }
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    
}

- (CGSize)getRenderedTextSize:(NSString *)text {
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:[self getLabelStringAttributes]];
    return [attrStr size];
}

- (NSDictionary *)getLabelStringAttributes {
    UIFont* font = self.font;
    UIColor* textColor = self.fontColor;
    return @{NSFontAttributeName : font, NSForegroundColorAttributeName : textColor};
}

- (void)drawLabelWithX:(CGFloat)x y:(CGFloat)y text:(NSString *)text {
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:[self getLabelStringAttributes]];
    [attrStr drawAtPoint:CGPointMake(x, y)];
}

- (BOOL)contains:(CGPoint)pointPx {
    CGRect rect = CGRectMake(self.pointPx.x, self.pointPx.y, 50, 20);
    return CGRectContainsPoint(rect, self.pointPx);
}


@end
