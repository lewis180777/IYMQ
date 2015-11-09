//
//  EGMGraphAxisValue.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 23/09/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphAxisValueDate.h"
#import "EGMGraphAxisLabel.h"

@interface EGMGraphAxisValueDate()

@property (nonatomic, strong) NSDateFormatter* formatter;
@property (nonatomic, strong) NSDate *internalDate; //TODO generic, move to superclass as scalar. we shouldnt need this here
@property (nonatomic, strong) NSDate *realDate;

@end

@implementation EGMGraphAxisValueDate

- (instancetype)initWithDate: (NSDate *)date formatter: (NSDateFormatter *) formatter {
    self = [super init];
    if (self) {
        self.date = date;
        self.formatter = formatter;
        
        self.realDate = date;
    }
    return self;
}

- (NSArray *)labels {
    NSString *formatted = [self.formatter stringFromDate:self.realDate];
    EGMGraphAxisLabel *graphAxisLabel = [[EGMGraphAxisLabel alloc] initWithText:formatted color:[UIColor blackColor] font:[UIFont systemFontOfSize:14]];
    graphAxisLabel.hidden = self.isHidden;
    return [NSArray arrayWithObjects: graphAxisLabel, nil];
}

- (CGFloat)scalar {
    // TODO generic
    if (self.internalDate) {
        return [self.internalDate timeIntervalSince1970];
    } else {
        return [self.realDate timeIntervalSince1970];
    }
}

- (void)setScalar:(CGFloat)scalar {
    self.date = [NSDate dateWithTimeIntervalSince1970:scalar];
}

- (void)setInternalScalar:(CGFloat)scalar {
    self.internalDate = [NSDate dateWithTimeIntervalSince1970:scalar];
}

- (CGFloat)getInternalScalar:(CGFloat)scalar {
    CGFloat internalScalar;
    if (self.internalDate) {
        internalScalar = [self.internalDate timeIntervalSince1970];
    } else {
        internalScalar = [self scalar];
    }
    return internalScalar;
}

- (EGMGraphAxisValue *)clone {
    EGMGraphAxisValueDate * clone = [[EGMGraphAxisValueDate alloc] init];
    [clone setScalar: [self scalar]];
    clone.formatter = self.formatter;
    clone.date = self.date;
    return clone;
}

- (BOOL)isEqual:(id)object {
    EGMGraphAxisValueDate *date = (EGMGraphAxisValueDate *)object;
    // 2 date axis values are equal if it's the same day
    // TODO make clear this date is day based, or create a new subclass
    return [[self zeroDate:self.date] isEqual:date];
}

// TODO date category
- (NSDate *)zeroDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit) fromDate:self.date];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end