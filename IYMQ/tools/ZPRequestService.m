//
//  ZPRequestService.m
//  RequestTest
//
//  Created by 张平 on 15/10/15.
//  Copyright © 2015年 zhangping. All rights reserved.
//

#import "ZPRequestService.h"
#import <QuartzCore/QuartzCore.h>

#define MAIN_TABLEVIEW_TEXTCOLOR [UIColor colorWithRed:0x1a/255.0 green:0xbd/255.0 blue:0x9b/255.0 alpha:1]

@interface ZPRequestService ()

@property (nonatomic, strong) UIView *originalView;
@property (nonatomic, strong) UIView *borderView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel *activityLabel;

@end

@implementation ZPRequestService

@synthesize originalView, borderView, activityIndicator, activityLabel, labelWidth, showNetworkActivityIndicator;

static ZPRequestService *zpActivityView = nil;

+ (ZPRequestService *)currentActivityView;
{
    return zpActivityView;
}

+ (ZPRequestService *)activityViewForView:(UIView *)addToView;
{
    return [self activityViewForView:addToView withLabel:NSLocalizedString(@"Loading...", @"Default DejalActivtyView label text") width:0];
}


+ (ZPRequestService *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText;
{
    return [self activityViewForView:addToView withLabel:labelText width:0];
}

+ (ZPRequestService *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;
{
    // Immediately remove any existing activity view:
    if (zpActivityView)
        [self removeView];
    
    // Remember the new view (so this is a singleton):
    zpActivityView = [[self alloc] initForView:addToView withLabel:labelText width:aLabelWidth];
    [addToView bringSubviewToFront:zpActivityView];
    return zpActivityView;
}

- (ZPRequestService *)initForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;
{
    if (!(self = [super initWithFrame:CGRectZero]))
        return nil;
    
    // Allow subclasses to change the view to which to add the activity view (e.g. to cover the keyboard):
    
    self.originalView = addToView;
    self.originalView.userInteractionEnabled = NO;
    
    addToView = [self viewForView:addToView];
    
    // Configure this view (the background) and its subviews:
    [self setupBackground];
    self.labelWidth = aLabelWidth;
    self.borderView = [self makeBorderView];
    self.activityIndicator = [self makeActivityIndicator];
    self.activityLabel = [self makeActivityLabelWithText:labelText];
    
    // Assemble the subviews:
    [addToView addSubview:self];
    [self addSubview:self.borderView];
    [self.borderView addSubview:self.activityIndicator];
    [self.borderView addSubview:self.activityLabel];
    
    // Animate the view in, if appropriate:
    [self animateShow];
    
    return self;
}

- (void)dealloc;
{
    if ([zpActivityView isEqual:self])
        zpActivityView = nil;
}

+ (void)removeView;
{
    
    if (!zpActivityView)
        return;
    
    if (zpActivityView.showNetworkActivityIndicator)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [zpActivityView removeFromSuperview];
     zpActivityView->originalView.userInteractionEnabled = YES;
    // Remove the global reference:
    zpActivityView = nil;
}

- (UIView *)viewForView:(UIView *)view;
{
    return view;
}

- (CGRect)enclosingFrame;
{
    return self.superview.bounds;
}

- (void)setupBackground;
{
    self.opaque = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (UIView *)makeBorderView;
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    
    view.opaque = NO;
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    return view;
}

- (UIActivityIndicatorView *)makeActivityIndicator;
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    
    return indicator;
}

- (UILabel *)makeActivityLabelWithText:(NSString *)labelText;
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    label.textAlignment = 0;//left;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset = CGSizeMake(0.0, 1.0);
    label.text = labelText;
    
    return label;
}

- (void)layoutSubviews;
{
    self.frame = [self enclosingFrame];
    
    // If we're animating a transform, don't lay out now, as can't use the frame property when transforming:
    if (!CGAffineTransformIsIdentity(self.borderView.transform))
        return;
    
//    CGSize textSize = [self.activityLabel.text sizeWithAttributes:<#(nullable NSDictionary<NSString *,id> *)#>];
     CGSize textSize = [self.activityLabel.text sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
    // Use the fixed width if one is specified:
    if (self.labelWidth > 10)
        textSize.width = self.labelWidth;
    
    self.activityLabel.frame = CGRectMake(self.activityLabel.frame.origin.x, self.activityLabel.frame.origin.y, textSize.width, textSize.height);
    
    // Calculate the size and position for the border view: with the indicator to the left of the label, and centered in the receiver:
    CGRect borderFrame = CGRectZero;
    borderFrame.size.width = self.activityIndicator.frame.size.width + textSize.width + 25.0;
    borderFrame.size.height = self.activityIndicator.frame.size.height + 10.0;
    borderFrame.origin.x = floor(0.5 * (self.frame.size.width - borderFrame.size.width));
    borderFrame.origin.y = floor(0.5 * (self.frame.size.height - borderFrame.size.height - 20.0));
    self.borderView.frame = borderFrame;
    
    // Calculate the position of the indicator: vertically centered and at the left of the border view:
    CGRect indicatorFrame = self.activityIndicator.frame;
    indicatorFrame.origin.x = 10.0;
    indicatorFrame.origin.y = 0.5 * (borderFrame.size.height - indicatorFrame.size.height);
    self.activityIndicator.frame = indicatorFrame;
    
    // Calculate the position of the label: vertically centered and at the right of the border view:
    CGRect labelFrame = self.activityLabel.frame;
    labelFrame.origin.x = borderFrame.size.width - labelFrame.size.width - 10.0;
    labelFrame.origin.y = floor(0.5 * (borderFrame.size.height - labelFrame.size.height));
    self.activityLabel.frame = labelFrame;
}


- (void)animateShow;
{
    // Does nothing by default
}


- (void)animateRemove;
{
    // Does nothing by default
}


- (void)setShowNetworkActivityIndicator:(BOOL)show;
{
    showNetworkActivityIndicator = show;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = show;
}

@end


@implementation ZPWhiteActivityView

- (UIActivityIndicatorView *)makeActivityIndicator;
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [indicator startAnimating];
    
    return indicator;
}

- (UILabel *)makeActivityLabelWithText:(NSString *)labelText;
{
    UILabel *label = [super makeActivityLabelWithText:labelText];
    
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor blackColor];
    
    return label;
}

@end

@implementation ZPActivityView

- (UIView *)viewForView:(UIView *)view;
{
    UIView *keyboardView = [[UIApplication sharedApplication] keyboardView];
    
    if (keyboardView)
        view = keyboardView.superview;
    
    return view;
}

- (CGRect)enclosingFrame;
{
    CGRect frame = [super enclosingFrame];
    
    if (self.superview != self.originalView){
        
        frame = [self.originalView convertRect:self.originalView.bounds toView:self.superview];
    }
    return frame;
}

- (void)setupBackground;
{
    [super setupBackground];
    
    //	self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.35];
}

- (UIView *)makeBorderView;
{
    UIView *view = [super makeBorderView];
    
    view.backgroundColor = MAIN_TABLEVIEW_TEXTCOLOR;  //背景颜色
    
    view.layer.cornerRadius = 10.0;
    
    return view;
}

- (UIActivityIndicatorView *)makeActivityIndicator;
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    v.backgroundColor = MAIN_TABLEVIEW_TEXTCOLOR;  //背景颜色
    [indicator addSubview:v];
    
    UIImageView *ACim = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Activityim"]];
    ACim.center = indicator.center;
    [indicator addSubview:ACim];
    
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_im"]];
    iv.center = indicator.center;
    
    [indicator addSubview:[self rotate360DegreeWithImageView:iv]];
    
    [indicator startAnimating];
    
    return indicator;
}

-(UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(M_PI*0.5, 0.0, 0.0, 1.0) ];
    animation.duration = 0.5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 1000;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
    return imageView;
}

- (UILabel *)makeActivityLabelWithText:(NSString *)labelText;
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    label.textAlignment = 1;//center
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.lineBreakMode = 0;//wrap
    label.text = labelText;
    
    return label;
}

- (void)layoutSubviews;
{
    // If we're animating a transform, don't lay out now, as can't use the frame property when transforming:
    if (!CGAffineTransformIsIdentity(self.borderView.transform))
        return;
    
    self.frame = [self enclosingFrame];
    
    CGSize maxSize = CGSizeMake(260, 400);
    CGSize textSize = [self.activityLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]] constrainedToSize:maxSize lineBreakMode:self.activityLabel.lineBreakMode];
    
    // Use the fixed width if one is specified:
    if (self.labelWidth > 10)
        textSize.width = self.labelWidth;
    
    // Require that the label be at least as wide as the indicator, since that width is used for the border view:
    if (textSize.width < self.activityIndicator.frame.size.width)
        textSize.width = self.activityIndicator.frame.size.width + 10.0;
    
    // If there's no label text, don't need to allow height for it:
    if (self.activityLabel.text.length == 0)
        textSize.height = 0.0;
    
    self.activityLabel.frame = CGRectMake(self.activityLabel.frame.origin.x, self.activityLabel.frame.origin.y, textSize.width, textSize.height);
    
    // Calculate the size and position for the border view: with the indicator vertically above the label, and centered in the receiver:
    CGRect borderFrame = CGRectZero;
    borderFrame.size.width = textSize.width + 30.0;
    borderFrame.size.height = self.activityIndicator.frame.size.height + textSize.height + 40.0;
    borderFrame.origin.x = floor(0.5 * (self.frame.size.width - borderFrame.size.width));
    borderFrame.origin.y = floor(0.5 * (self.frame.size.height - borderFrame.size.height));
    self.borderView.frame = borderFrame;
    
    // Calculate the position of the indicator: horizontally centered and near the top of the border view:
    CGRect indicatorFrame = self.activityIndicator.frame;
    indicatorFrame.origin.x = 0.5 * (borderFrame.size.width - indicatorFrame.size.width);
    indicatorFrame.origin.y = 20.0;
    self.activityIndicator.frame = indicatorFrame;
    
    // Calculate the position of the label: horizontally centered and near the bottom of the border view:
    CGRect labelFrame = self.activityLabel.frame;
    labelFrame.origin.x = floor(0.5 * (borderFrame.size.width - labelFrame.size.width));
    labelFrame.origin.y = borderFrame.size.height - labelFrame.size.height - 10.0;
    self.activityLabel.frame = labelFrame;
}

- (void)animateShow;
{
    self.alpha = 0.0;
    self.borderView.transform = CGAffineTransformMakeScale(3.0, 3.0);
    
    [UIView beginAnimations:nil context:nil];
    //	[UIView setAnimationDuration:5.0];            // Uncomment to see the animation in slow motion
    
    self.borderView.transform = CGAffineTransformIdentity;
    self.alpha = 1.0;
    
    [UIView commitAnimations];
}

- (void)animateRemove;
{
    if (self.showNetworkActivityIndicator)
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    self.borderView.transform = CGAffineTransformIdentity;
    
    [UIView beginAnimations:nil context:nil];
    //	[UIView setAnimationDuration:5.0];            // Uncomment to see the animation in slow motion
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeAnimationDidStop:finished:context:)];
    
    self.borderView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.alpha = 0.0;
    
    [UIView commitAnimations];
}

- (void)removeAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
{
    [[self class] removeView];
}

+ (void)removeViewAnimated:(BOOL)animated;
{
    if (!zpActivityView)
        return;
    
    if (animated)
        [zpActivityView animateRemove];
    else
        [[self class] removeView];
}

@end

@implementation ZPKeyboardActivityView

+ (ZPKeyboardActivityView *)activityView;
{
    return [self activityViewWithLabel:NSLocalizedString(@"Loading...", @"Default DejalActivtyView label text")];
}

+ (ZPKeyboardActivityView *)activityViewWithLabel:(NSString *)labelText;
{
    UIView *keyboardView = [[UIApplication sharedApplication] keyboardView];
    
    if (!keyboardView)
        return nil;
    else
        return (ZPKeyboardActivityView *)[self activityViewForView:keyboardView withLabel:labelText];
}

- (UIView *)viewForView:(UIView *)view;
{
    return view;
}

- (void)animateShow;
{
    self.alpha = 0.0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    
    self.alpha = 1.0;
    
    [UIView commitAnimations];
}

- (void)animateRemove;
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeAnimationDidStop:finished:context:)];
    
    self.alpha = 0.0;
    
    [UIView commitAnimations];
}

- (void)setupBackground;
{
    [super setupBackground];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85];
}

- (UIView *)makeBorderView;
{
    UIView *view = [super makeBorderView];
    
    view.backgroundColor = nil;
    
    return view;
}

@end

@implementation UIApplication (KeyboardView)

- (UIView *)keyboardView;
{
    NSArray *windows = [self windows];
    for (UIWindow *window in [windows reverseObjectEnumerator])
    {
        for (UIView *view in [window subviews])
        {
            // UIPeripheralHostView is used from iOS 4.0, UIKeyboard was used in previous versions:
            if (!strcmp(object_getClassName(view), "UIPeripheralHostView") || !strcmp(object_getClassName(view), "UIKeyboard"))
            {
                return view;
            }
        }
    }
    
    return nil;
}

@end


