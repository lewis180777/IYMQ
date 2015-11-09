//
//  MCViewController.m
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import "MCViewController.h"

@interface MCViewController ()

@property (nonatomic, retain) NSMutableArray *backupRectArray;
@property (nonatomic, retain) NSMutableArray *backupViewArray;
@end

@implementation MCViewController

- (id)initWithData:(id)aData {
    if (self = [super init]) {
        self.data = aData;
        self.dataQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
        self.dataGroup = dispatch_group_create();
        __block MCViewController *vc = self;
        dispatch_group_async(self.dataGroup, self.dataQueue, ^{
            [vc toBackAddData];
        });
    }
    return self;
}
//子类继承此方法加载subviews
- (void)loadView {
    [super loadView];
}
//在初始化开创子线程，子类继承此方法加载数据
- (void)toBackAddData {
}
//subviews加载完后，子类继承此方法加载数据
- (void)toMainLoadData {
}
//子类不能继承此方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block MCViewController *vc = self;
    if(self.dataGroup) {
        dispatch_group_notify(self.dataGroup, dispatch_get_main_queue(), ^{
            [vc toMainLoadData];
        });
    }
}
- (void)backupView:(UIView *)aView {
    if (self.backupViewArray == nil) {
        self.backupViewArray  = [NSMutableArray array];
        self.backupRectArray  = [NSMutableArray array];
    }
    

    NSString *rectString  = NSStringFromCGRect(aView.frame);
    
    [self.backupViewArray addObject:aView];
    [self.backupRectArray addObject:rectString];
}

#pragma mark - 页面开始显示与消失的动画
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dispatch_once(&_pred, ^{
        [self viewDidAppearAnimation];
    });
}
- (void)viewDidAppearAnimation
{
    
}
- (void)viewDisappearAnimation:(void (^)(BOOL))animation
{
    if (self.changeImageString != nil && ![self.changeImageString isEqualToString:self.backgroundImageString]) {
        [UIView transitionWithView:self.backgroundImageView
                          duration:viewDisappearTime
                           options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            
                            self.backgroundImageView.image = [UIImage bundleImage:self.changeImageString];
                        }
                        completion:^(BOOL finished) {
                            if (animation != NULL) {
                                animation(YES);
                            }
                            
                        }];
        if (self.backupViewArray != nil) {
            [UIView animateWithDuration:viewDisappearTime animations:^{
                for (int i = 0 ; i < [self.backupViewArray count]; i++) {
                    
                    UIView *view = self.backupViewArray[i];
                    view.frame = CGRectFromString(self.backupRectArray[i]);
                    view.alpha = 0;
                }
            }];
        }
    } else {
        if (self.backupViewArray != nil) {
            [UIView animateWithDuration:viewDisappearTime
                             animations:^{
                                 for (int i = 0 ; i < [self.backupViewArray count]; i++) {
                                     
                                     UIView *view = self.backupViewArray[i];
                                     view.frame = CGRectFromString(self.backupRectArray[i]);
                                     view.alpha = 0;
                                 }
                             } completion:^(BOOL finished) {
                                 if (animation != NULL) {
                                     animation(YES);
                                 }
                             }];
        } else {
            if (animation != NULL) {
                animation(YES);
            }
        }
    }
}

#pragma mark - CreateBackGroundView
- (void)createBackGroundView
{
    if (self.backgroundImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:SCREEN_FRAME];
        self.backgroundImageView = imageView;
        UU_RELEASE(imageView);
        [self.view addSubview:self.backgroundImageView];
        
        if (self.backgroundImageString != nil) {
            self.backgroundImageView.image = [UIImage bundleImage:self.backgroundImageString];
        }
    }
}
- (void)setBackgourndImageViewString:(NSString *)backgourndImageViewString
{
    if (self.backgroundImageString != backgourndImageViewString) {
        self.backgroundImageString = backgourndImageViewString;
        [self createBackGroundView];
        self.backgroundImageView.image = [UIImage bundleImage:self.backgroundImageString];
    }
}
#pragma mark - CreateWebView
- (void)createWebView
{
    if (self.webView == nil) {
        UIWebView *webView = [[UIWebView alloc] init];
        self.webView = webView;
        UU_RELEASE(webView);
        self.webView.backgroundColor = [UIColor clearColor];
        self.webView.opaque = NO;
        self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
        
        self.webView.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        self.webView.scrollView.showsVerticalScrollIndicator = NO;
        self.webView.scrollView.showsHorizontalScrollIndicator = NO;
        self.webView.scrollView.bounces = NO;
        
        [self.view addSubview:self.webView];
    }
}
- (void)createWebViewShow:(WebViewDisable)disableTag
{
    [self createWebView];
    self.webView.tag = disableTag;
}
- (void)setWebViewString:(NSString *)webViewString
{
    if (self.webViewString != webViewString) {
        
        self.webViewString = webViewString;
        [self createWebView];
        
        NSString *string = [NSString stringWithFormat:@"<html><head></head><style type=\"text/css\">body{}span{}</style><body><div style=\"word-wrap:break-word; width:100%%;height:100%%\">%@</div></body></html>",self.webViewString];
        
        [self.webView loadHTMLString:string baseURL:nil];
        
        if (self.webView.tag == noDisableHorizontalScrollTag || self.webView.tag == noDisableVerticalScrollTag) {
            [self performSelector:@selector(flashWebViewScrollIndicators) withObject:nil afterDelay:0.5];
        }
    }
}
- (void)flashWebViewScrollIndicators
{
    [self.webView.scrollView flashScrollIndicators];
}

#pragma mark - CreateNextButton
- (void)createNextButton
{
    if (self.nextButton == nil) {
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nextButton addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.nextButton];
    }
}
- (void)nextButtonAction:(UIButton *)sender
{
    
}
- (void)setNextButtonImageString:(NSString *)nextButtonImageString
{
    if (self.nextButtonImageString != nextButtonImageString) {
        self.nextButtonImageString = nextButtonImageString;
        
        [self createNextButton];
        [self.nextButton setBackgroundImage:[UIImage bundleImage:self.nextButtonImageString] forState:UIControlStateNormal];
    }
}

#pragma mark - CreateContentView
- (void)createContentView
{
    
}

#pragma mark- CreateHelpView
- (void)createHelpView{
    if (self.helpView == nil) {
        UIView *view = [[UIView alloc] init];
        self.helpView = view;
        UU_RELEASE(view);
    }
}
- (void)dealloc {
    self.webView = nil;
    self.nextButton = nil;
    self.backgroundImageView = nil;
    self.helpView = nil;
    self.webViewString = nil;
    self.webViewString = nil;
    self.nextButtonImageString = nil;
    self.backgroundImageString = nil;
    self.changeImageString = nil;
    self.data = nil;
    
    self.backupRectArray = nil;
    self.backupViewArray = nil;
    
    self.dataQueue = nil;
    if (self.dataGroup != nil) {
        dispatch_release(self.dataGroup);
        self.dataGroup = nil;
    }
    UU_DEALLOC;
}
@end
