//
//  EGMGraphLabelRenderer.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 18/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphItemRenderer.h"

@interface EGMGraphLabelRenderer : EGMGraphItemRenderer

@property (nonatomic, nonatomic) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *fontColor;
@property (nonatomic, assign) CGFloat rotation;

@property (nonatomic, assign) NSInteger anchor; //TODO enum
@property (nonatomic, assign) BOOL keepSameXCenterAfterRotation;

- (CGSize)getRenderedTextSize:(NSString *)text;

@end
