//
//  XZLargeImageMonito.m
//  Chat
//
//  Created by iXcoder on 15/4/29.
//  Copyright (c) 2015年 iXcoder. All rights reserved.
//

#import "XZLargeImageDisplayer.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"

#ifndef SCREEN_SIZE
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

#ifndef APP_WINDOW
#define APP_WINDOW [(AppDelegate *)[UIApplication sharedApplication].delegate window]
#endif

@interface XZLargeImageDisplayer()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
{
    
}
@property (nonatomic, assign) NSInteger current;
@property (nonatomic ,assign) NSMutableArray *bigImages;
@property (nonatomic, strong) NSMutableArray *viewInfos;
@property (nonatomic, strong) UIScrollView *ctntView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UITapGestureRecognizer *dismissGes;

@end


@implementation XZLargeImageDisplayer

- (void)dealloc
{
    self.current = -1;
    [self.bigImages removeAllObjects];
    self.bigImages = nil;
    [self.viewInfos removeAllObjects];
    self.viewInfos = nil;
    [self.ctntView removeFromSuperview];
    self.ctntView = nil;
}

- (instancetype)init
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.viewInfos = [NSMutableArray array];
        self.bigImages = [NSMutableArray array];
        self.current = 0;
        
        [self initDisplayer];
        
        [self initGesResponder];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)]) {
        self.viewInfos = [NSMutableArray array];
        self.bigImages = [NSMutableArray array];
        self.current = 0;
        
        [self initDisplayer];
        
        [self initGesResponder];
    }
    return self;
}

- (void)initDisplayer
{
    self.ctntView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.ctntView.delegate = self;
    self.ctntView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.ctntView.backgroundColor = [UIColor clearColor];
    self.ctntView.showsHorizontalScrollIndicator = NO;
    self.ctntView.pagingEnabled = YES;
    [self addSubview:self.ctntView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 20)];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.pageControl addTarget:self
                         action:@selector(pageControlValueChanged:)
               forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.pageControl];
}

- (void)initGesResponder
{
    UITapGestureRecognizer *dismissGes = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(dismissGesHandler:)];
    dismissGes.delegate = self;
    self.dismissGes = dismissGes;
    
    [self addGestureRecognizer:self.dismissGes];
}

- (void)dismissGesHandler:(UITapGestureRecognizer *)sender
{
    [self dismiss];
}

- (void)doubleGesHandler:(UITapGestureRecognizer *)sender
{
    UIView *view = sender.view;
    UIScrollView *scroll = (UIScrollView *)view.superview;
    CGFloat zoomScale = scroll.zoomScale > 1.0 ? 1.0 : 2.0f;
    [scroll setZoomScale:zoomScale animated:YES];
}

- (void)pageControlValueChanged:(id)sender
{
    CGRect rect = CGRectMake(SCREEN_SIZE.width * self.pageControl.currentPage, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
    [self.ctntView scrollRectToVisible:rect animated:YES];
}

- (void)showDisplayerWithPaths:(NSArray *)paths originViews:(NSArray *)views defaultIndex:(NSUInteger)idx tapDismiss:(BOOL)tapDismiss
{
//    [self initDisplayer];
    [self saveViewsInfo:views atPath:paths];
    self.current = idx;
    self.pageControl.currentPage = self.current;
    [self initDisplayContent];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    [self show];
}

- (void)saveViewsInfo:(NSArray *)views atPath:(NSArray *)paths
{
    for (int i = 0; i < views.count; i++) {
        UIView *view = [views objectAtIndex:i];
        CGRect f = [view.superview convertRect:view.frame toView:APP_WINDOW];
        NSMutableDictionary *itemInfo = [NSMutableDictionary dictionary];
        [itemInfo setObject:[NSValue valueWithCGRect:f] forKey:@"position"];
        [itemInfo setObject:[paths objectAtIndex:i] forKey:@"path"];
        
        [self.viewInfos addObject:itemInfo];
    }
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.viewInfos.count;
}

- (void)initDisplayContent
{
    for (UIView *sub in self.ctntView.subviews) {
        [sub removeFromSuperview];
    }
    for (int i = 0; i < self.viewInfos.count; i++) {
        CGRect f = CGRectMake(i * SCREEN_SIZE.width, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:f];
        scroll.delegate = self;
        scroll.maximumZoomScale = 3.f;
        scroll.minimumZoomScale = 1.f;
        NSDictionary *item = [self.viewInfos objectAtIndex:i];

        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
        iv.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        NSURL *URL = [NSURL URLWithString:item[@"path"]];
        CGAffineTransform transform = CGAffineTransformIdentity;
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.transform = transform;
        iv.userInteractionEnabled = YES;
        [iv setImageWithURL:URL];
        iv.tag = 345;
        scroll.contentMode = UIViewContentModeCenter;
        
        UITapGestureRecognizer *doubleGes = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(doubleGesHandler:)];
        doubleGes.numberOfTapsRequired = 2;
        [iv addGestureRecognizer:doubleGes];
        [self.dismissGes requireGestureRecognizerToFail:doubleGes];
        doubleGes = nil;
        
        [self.bigImages addObject:iv];

        [scroll addSubview:iv];
        iv.alpha = i != self.current;
        scroll.clipsToBounds = YES;
        if (i == self.current) {
            transform = [self defaultImageAffineTransform];
        }
        iv.transform = transform;
        [self.ctntView addSubview:scroll];
        scroll = nil;
    }
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    for (id obj in self.bigImages) {
        if (![obj isKindOfClass:[UIImageView class]]) {
            [set addIndex:[self.bigImages indexOfObject:obj]];
        }
    }
    [self.bigImages removeObjectsAtIndexes:set];
    CGSize ctntSize = CGSizeMake(self.viewInfos.count * self.frame.size.width
                                 , self.frame.size.height);
    self.ctntView.contentSize = ctntSize;
    self.ctntView.scrollEnabled = YES;
    
    CGRect f = CGRectMake(SCREEN_SIZE.width * self.current, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
    [self.ctntView scrollRectToVisible:f animated:NO];
    
}

- (void)show
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    UIImageView *firstImg = [self.bigImages objectAtIndex:self.current];
    [APP_WINDOW addSubview:self];
    [UIView animateWithDuration:0.382
                     animations:^{
                         self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
                         
                         firstImg.alpha = 0.8;
                     }
                     completion:^(BOOL finished) {
                         firstImg.clipsToBounds = YES;
                         [UIView animateWithDuration:0.618
                                          animations:^{
                                              self.backgroundColor = [UIColor blackColor];
                                              firstImg.transform = CGAffineTransformIdentity;
                                              firstImg.alpha = 1.0;
                                          }];
                     }];
}

- (CGAffineTransform)defaultImageAffineTransform
{
    return [self imageDeflateAffineTransform:self.current];
}

/*
 * @brief       缩小动画
 * @function    imageDeflateAffineTransform:
 * @param       imgIdx
 * @return      (CGAffineTransform)
 */
- (CGAffineTransform)imageDeflateAffineTransform:(NSUInteger)imgIdx
{
    CGAffineTransform at = CGAffineTransformIdentity;
    NSDictionary *item = [self.viewInfos objectAtIndex:imgIdx];
    CGRect origin = [[item objectForKey:@"position"] CGRectValue];
    at = [self transformFrom:[UIScreen mainScreen].bounds to:origin];
    
    return at;
}

- (CGAffineTransform)transformFrom:(CGRect)start to:(CGRect)end
{
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformTranslate(t
                                   , CGRectGetMidX(end) - CGRectGetMidX(start)
                                   , CGRectGetMidY(end) - CGRectGetMidY(start));
    CGFloat wrate = CGRectGetWidth(end) / CGRectGetWidth(start);
    CGFloat hrate = CGRectGetHeight(end) / CGRectGetHeight(start);
    t = CGAffineTransformScale(t, MAX(wrate, hrate), MAX(wrate, hrate));
    return t;
}

+ (void)show
{
//    [displayer show];
}

- (void)dismiss
{
    UIImageView *currentImg = [self.bigImages objectAtIndex:self.current];
    [UIView animateWithDuration:.35
                     animations:^{
                         self.backgroundColor = [UIColor clearColor];
                         currentImg.transform = [self imageDeflateAffineTransform:self.current];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

+ (void)dismiss
{
//    [displayer dismiss];
}

#pragma mark - UIScrollViewDelegate method
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView != self.ctntView) {
        return ;
    }
    self.current = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    for (UIView *sub in self.ctntView.subviews) {
        if (![sub isKindOfClass:[UIScrollView class]]) {
            return ;
        }
        [(UIScrollView *)sub setZoomScale:1.0];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == self.ctntView) {
        return nil;
    }
    return [scrollView viewWithTag:345];
}

#pragma mark - UIGestureRecognizerDelegate method
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}



@end
