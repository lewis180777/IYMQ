//
//  ComponentsFactory.h
//  FJPZGZ
//
//  Created by Ma Genius on 10-10-16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComponentsFactory: NSObject{
	
}

+ (UIButton *)buttonWithType:(NSUInteger)type
					   title:(NSString *)title 
					   frame:(CGRect)frame
				   imageName:(NSString *)imageName
			 tappedImageName:(NSString *)tappedImageName
					  target:(id)target 
					  action:(SEL)selector 
						 tag:(NSInteger)tag;

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
                        tag:(NSInteger)tag
                  hasShadow:(Boolean)hasShadow;

// colin: generate label with auto calculated frame size
+ (UILabel *) labelWithText:(NSString *)text font:(UIFont *) font x:(CGFloat) x y:(CGFloat) y;

+ (UITextField *)textFieldWithFrame:(CGRect)frame
						borderStyle:(UITextBorderStyle)borderStyle
						  textColor:(UIColor *)textColor
					backgroundColor:(UIColor *)backgroundColor
							   font:(UIFont *)font
					   keyboardType:(UIKeyboardType)keyboardType
								tag:(NSInteger)tag;

+ (UITextView *)textViewWithFrame:(CGRect)frame
						textColor:(UIColor *)textColor
							 font:(UIFont *)font
							 text:(NSString*) text;


+(NSString*)getUUID;


+ (UIColor*) createColorByHex:(NSString *)hexColor;

//过滤空格函数
+(NSString*)filterSpace:(NSString*) aFilterString;

/*
 输入时间返回星期几
 
 */
+(NSInteger)GetWeekDayFromYear:(NSInteger)aYear 
				  AndFromMonth:(NSInteger)aMonth 
					AndFromDay:(NSInteger)aDay;


/*
 aInterval 间隔天数,-1为前一天,1为往后退一天,0为当前时间
 返回值为输入时间间隔天数的NSDate
 
 */
+(NSDate*)GetNSDateFromYear:(NSInteger)aYear 
			   AndFromMonth:(NSInteger)aMonth 
				 AndFromDay:(NSInteger)aDay
				IntervalDay:(NSInteger)aInterval;

/*
 aInterval 间隔月数,-1为前一天,1为往后退一天,0为当前时间
 返回值为输入时间间隔月数的NSDate
 
 */
+(NSDate*)GetNSDateFromYear:(NSInteger)aYear 
			   AndFromMonth:(NSInteger)aMonth 
				 AndFromDay:(NSInteger)aDay
			  IntervalMonth:(NSInteger)aInterval;



//Example NSDate to 20101030,返回8位年月日
+(NSString*)GetStringFromNSDate:(NSDate*)aDate;


//Example 20101030 to 7
+(NSInteger)GetWeekDayFromString:(NSString*)aString;



//20101010  TO 2010-10-10
+(NSString*)getStringFormat:(NSString*)aString;

//2010-10-10  TO 20101010
+(NSString*)getStringFormatReverse:(NSString*)aString;

//201108  TO 2010-08
+(NSString*)getStringFormat2:(NSString*)aString;


//20101010  TO NSDate
+(NSDate*)getNSDateFromStringTime:(NSString*)aString 
					 intervalTime:(NSInteger)aInterval;

+(NSDate*)getNSDateFromStringTime:(NSString*)aString 
					intervalMonth:(NSInteger)aInterval;


//key ,year ,month ,value type string
+(NSDictionary*)GetYearAndMonthFromNSDate:(NSDate*)aDate;

//输入年月,返回这个月最后一天的NSDate
+(NSDate*)GetMonthNSDateFromYear:(NSInteger)aYear FromMonth:(NSInteger)aMonth;

//begindate:20101222 return 12.22
+(NSString*)getLastDate:(NSString*)begindate;

//begindate:20101201 return 12/11
+(NSString*)getMonthChartDate:(NSString*)begindate;

+(NSDate*)GetNSDateFromYear:(NSInteger)aYear 
			   AndFromMonth:(NSInteger)aMonth 
				 AndFromDay:(NSInteger)aDay;

+(NSDate*)getNSDateFromString:(NSString*)aString;

+(NSString*)getNextChartDateStr:(NSString*)fromChartDate
				 chartTypeCycle:(NSString*)cycle 
					  oriention:(BOOL)isBehind;

//EX:20120516125445 TO 2012-05-16 12:54:45
+(NSString*)getDateStringWithString:(NSString*)dateString;

+(NSString*)mdnFormat:(NSString*)mdnString rangeOfString:(NSString*)aString;

//EX:999999.00 TO 999,999.00 
+(NSString*)moneyFormat:(NSString*)moneyString;

//inline static  UITextField * createTextField(NSString *string, CGRect rect) {
//    UITextField *field = [[UITextField alloc] initWithFrame:rect];
//    field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    field.textColor = [UIColor blackColor];
//    field.borderStyle = UITextBorderStyleRoundedRect;
//    field.placeholder = string;
//    field.font = [UIFont boldSystemFontOfSize:17.0];
//    field.clearButtonMode = UITextFieldViewModeWhileEditing;
//    return field;
//}
////截取部分图像  
+(UIImage*)subImage:(UIImage *)image rect:(CGRect)rect;


+(void)showAlertViewTitle:(NSString*)title message:(NSString*)message delegate:(id)delegate tag:(NSInteger)tag cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitles:(NSString*)otherButtonTitles,...;

//获取mac地址
+(NSString *)MacAddress;

+ (UILabel*) lableWithText:(NSString*)title font:(UIFont*)font;
//倒置图片
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

//身份证号是否正确
+(BOOL)checkIdentificationNumber:(NSString *) ideNum;

+(void)dispatch_process_with_thread:(UIImage* (^)())block1 result:(void (^)(UIImage*))block2;

@end

/*
 
 NSDate* tempDate = [NSDate dateWithTimeIntervalSinceNow:(24*3600+11)];
 NSLog(@"%@",tempDate);
 
 //CFAbsoluteTime myCurrentTime = CFAbsoluteTimeGetCurrent();
 
 
 int a = [self GetWeekDayFromYear:2010
 AndFromMonth:[@"09" intValue]
 AndFromDay:26];
 
 NSLog(@"%d",a);
 
 NSDate *b = [self GetNSDateFromYear:2010
 AndFromMonth:10 
 AndFromDay:26
 IntervalDay:0];
 NSLog(@"%@",b);
 
 */

