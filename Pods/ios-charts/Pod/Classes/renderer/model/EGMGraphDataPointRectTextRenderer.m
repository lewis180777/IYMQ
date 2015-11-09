//
//  EGMGraphDataPointRectTextRenderer.m
//  newgraph
//
//  Created by Ivan Schuetz on 20/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRectTextRenderer.h"
#import "EGMGraphView.h"

const CGFloat kMinRectWidthForAutoFit = 30.0f;

@interface EGMGraphDataPointRectTextRenderer()
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, assign) BOOL fitBounds;
@property (nonatomic, assign) CGFloat fitBoundsPaddingH;
@property (nonatomic, assign) CGFloat fitBoundsPaddingV;

@end

@implementation EGMGraphDataPointRectTextRenderer

@synthesize text = _text;

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor textFont:(UIFont *)textFont fitBounds:(BOOL)fitBounds fitBoundsPaddingH:(CGFloat)fitBoundsPaddingH fitBoundsPaddingV:(CGFloat)fitBoundsPaddingV {
 
    NSString *text= [dataPoint getText];

    CGSize rectSize = [EGMGraphDataPointRectTextRenderer getRectSizeForFont:textFont textColor:textColor text:text fitBoundsPaddingH:fitBoundsPaddingH fitBoundsPaddingV:fitBoundsPaddingV];
    
    self = [self initWithPointPx:pointPx dataPoint:dataPoint rectSize:rectSize color:color cornerRadius:cornerRadius textColor:textColor textFont:textFont];
    
    if (self) {
        self.fitBounds = YES;
        self.fitBoundsPaddingH = fitBoundsPaddingH;
        self.fitBoundsPaddingV = fitBoundsPaddingV;
    }
    
    return self;
}

- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor textFont:(UIFont *)textFont {
    self = [super initWithPointPx:pointPx dataPoint:dataPoint rectSize:size color:color cornerRadius:cornerRadius];
    
    if (self) {
        self.textFont = textFont;
        self.textColor = textColor;
    }
    return self;
}

+ (CGSize)getRectSizeForFont:(UIFont *)textFont textColor:(UIColor *)textColor text:(NSString *)text fitBoundsPaddingH:(CGFloat)fitBoundsPaddingH fitBoundsPaddingV:(CGFloat)fitBoundsPaddingV {
    CGSize rectSize;
    if (text) {
        NSDictionary *fontAttributes = @{NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor};
        CGSize fittingSize = [self getRenderedTextSize:text fontAttributes:fontAttributes];
        fittingSize.width += fitBoundsPaddingH;
        fittingSize.width = MAX(fittingSize.width, kMinRectWidthForAutoFit); // don't let width shrink below this otherwise our poins look like little eggs
        fittingSize.height += fitBoundsPaddingV;
        rectSize = fittingSize;
        
    } else {
        rectSize = CGSizeZero;
    }
    return rectSize;
}


+ (CGSize)getRenderedTextSize:(NSString *)text fontAttributes:(NSDictionary *)fontAttributes {
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:fontAttributes];
    return [attrStr size];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    [super onAddOverlays:graph];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.pointPx.x - (self.rectSize.width / 2), self.pointPx.y - (self.rectSize.height / 2), self.rectSize.width, self.rectSize.height)];
    self.label.font = self.textFont;
    self.label.textColor = self.textColor;
    [self.label setTextAlignment:NSTextAlignmentCenter];


    NSString *text = self.text;

    self.label.text = text;
    
    [graph addSubview:self.label];
}

- (NSString *)text {
    if (!_text) {
        return self.dataPoint.getText;
    } else {
        return _text; // allow to overwrite datapoint's text
    }
}

- (void)setText:(NSString *)text {
    _text = text;
    [self onSetText];
}

- (void)onSetText {
    if (self.fitBounds) { // adjust rect size
        CGSize rectSize = [EGMGraphDataPointRectTextRenderer getRectSizeForFont:self.textFont textColor:self.textColor text:self.text fitBoundsPaddingH:self.fitBoundsPaddingH fitBoundsPaddingV:self.fitBoundsPaddingV];
        self.rectSize = rectSize;
    }
}

- (void)cleanup {
    [super cleanup];
    [self.label removeFromSuperview];
}


@end
