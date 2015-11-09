//
//  EGMGraphAxisLabel.h
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/11/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGMGraphAxisLabel : NSObject

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, strong, readonly) UIFont *font;
@property (nonatomic, assign) BOOL hidden;

- (instancetype)initWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font;

@end
