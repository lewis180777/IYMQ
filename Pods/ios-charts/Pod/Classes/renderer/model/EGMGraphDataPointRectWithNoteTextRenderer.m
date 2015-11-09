//
//  EGMGraphDataPointRectWithNoteTextRenderer.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 25/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphDataPointRectWithNoteTextRenderer.h"
#import "EGMGraphView.h"


@interface EGMGraphDataPointRectWithNoteTextRenderer()

@property (nonatomic, assign) CGFloat space;
@property (nonatomic, strong) UILabel *noteLabel;
@property (nonatomic, strong) UIFont *noteTextFont;
@property (nonatomic, strong) UIColor *noteTextFontColor;
@property (nonatomic, strong) NSString *noteText;
@property (nonatomic, strong) EGMGraphDataPointRectTextRenderer *leftRect;
@property (nonatomic, assign) CGSize leftRectSize;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) CGRect labelRect;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGSize rightRectSize;


@property (nonatomic, assign) BOOL initFieldsSet; //FIXME there should be a better way to do this

//TODO generic solution for subitem alignment

@property (nonatomic, assign) CGRect leftItemRect;

@end

@implementation EGMGraphDataPointRectWithNoteTextRenderer

//TODO rename size -> leftRectSize
- (instancetype)initWithPointPx:(CGPoint)pointPx dataPoint:(EGMGraphDataPoint *)dataPoint rectSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius textColor:(UIColor *)textColor space:(CGFloat)space textFont:(UIFont *)textFont noteTextFont:(UIFont *)noteTextFont  noteTextFontColor:(UIColor *)noteTextFontColor noteText:(NSString *)noteText {
    
    self = [super initWithPointPx:pointPx dataPoint:dataPoint];
    
    if (self) {
        self.space = space;
        self.noteTextFont = noteTextFont;
        self.noteTextFontColor = noteTextFontColor;
        self.noteText = noteText;
        self.leftRectSize = size;
        self.textColor = textColor;
        self.textFont = textFont;
        self.color = color;
        self.cornerRadius = cornerRadius;
        self.size = size;
        //        self.rect = [self makeRect];
        self.itemAlignement = 0;
        self.rightRectSize = [self getRenderedTextSize:noteText font:noteTextFont];
        self.initFieldsSet = YES;
        
        [self layoutViews:pointPx];

    }
    return self;
}

- (void)layoutViews:(CGPoint)pointPx {
    //left rect
    //pointPx is the center of left rect - pass that to left rect, left rect does offset to origin
    self.leftRect = [[EGMGraphDataPointRectTextRenderer alloc]initWithPointPx:pointPx dataPoint:self.dataPoint rectSize:self.size color:self.color cornerRadius:self.cornerRadius textColor:self.textColor textFont:self.textFont];
    
    //right rect ("label rect")
//    self.labelRect = CGRectMake(self.size.width + self.space, self.size.height, self.rightRectSize.width, self.rightRectSize.height);
    self.labelRect = CGRectMake(self.leftRect.pointPx.x + (self.size.width / 2) + self.space,
                                self.leftRect.pointPx.y - (self.rightRectSize.height / 2),
                                self.rightRectSize.width,
                                self.rightRectSize.height);

    //total rect (left + right part)
    CGFloat originX = pointPx.x - (self.size.width / 2);
    CGFloat originY = pointPx.y - (self.size.height / 2);
    CGFloat totalWidth = self.size.width + self.space + self.rightRectSize.width;
    CGFloat totalHeight = self.size.height;
    CGRect totalRect = CGRectMake(originX, originY, totalWidth, totalHeight);
    _rect = totalRect;
}


- (void)setOrigin:(CGPoint)point {
    [self setPointPx:CGPointMake(
                                 point.x + (self.size.width / 2),
                                 point.y + (self.size.height / 2))];
}

- (CGRect)getRect {
    return _rect;
}

- (void)setPointPx:(CGPoint)pointPx {
    [super setPointPx:pointPx];
    
    if (self.initFieldsSet) { //this is to prevent that during initialisation when super sets  pointPx we enter layoutViews and run into exception because all the instance fields haven't been set yet
        [self layoutViews:pointPx];
    }
}

//TODO if this is called before setPointPx, setPointPx should take alignement into account to do layout
- (void)setItemAlignement:(NSInteger)itemAlignement {
    if (itemAlignement == 0) { //left
        self.leftItemRect = self.leftRect.rect;
        self.leftRect.pointPx = self.pointPx;
        CGRect leftRect = [self.leftRect getRect];
        self.labelRect = CGRectMake(
                                    leftRect.origin.x + leftRect.size.width + self.space,
                                    leftRect.origin.y,
                                    [self getRenderedTextSize:self.noteText font:self.noteTextFont].width,
                                    leftRect.size.height
                                    );
    } else { //right
        self.leftItemRect = self.labelRect;
        CGRect leftRect = [self.leftRect getRect];
        self.labelRect = CGRectMake(
                                    leftRect.origin.x,
                                    leftRect.origin.y,
                                    [self getRenderedTextSize:self.noteText font:self.noteTextFont].width,
                                    leftRect.size.height
                                    );
        self.leftRect.pointPx = CGPointMake(
                                            self.labelRect.origin.x + self.labelRect.size.width + self.space + (self.leftRect.rect.size.width / 2),
                                            self.leftRect.pointPx.y);
    }
}

- (void)onRender:(CGContextRef)context graph:(EGMGraphView *)graph {
    [self.leftRect onRender:context graph:graph];
}

- (void)onAddOverlays:(EGMGraphView *)graph {
    [super onAddOverlays:graph];
    
    [self.leftRect onAddOverlays:graph];
    if (self.noteText && !([self.noteText length] == 0)) {
        self.noteLabel = [[UILabel alloc] initWithFrame:self.labelRect];
        self.noteLabel.font = self.noteTextFont;
        self.noteLabel.textColor = self.noteTextFontColor;
        self.noteLabel.text = self.noteText;
        [graph addSubview:self.noteLabel];
    }
}

- (CGSize)getRenderedTextSize:(NSString *)text font:(UIFont *)font {
    if (!text || [text length] == 0) { //TODO only 1 getRenderedTextSize, with this check
        return CGSizeZero;
    } else {
        NSDictionary *fontAttributes = @{NSFontAttributeName : font};
        NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:text attributes:fontAttributes];
        return [attrStr size];
    }
}

@end
