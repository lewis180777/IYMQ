//
//  MCViewController.h
//  MC
//
//  Created by WXH on 15/4/15.
//  Copyright (c) 2015年 WXH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+MCWebScrollView.h"
#import "UIImage+MCImage.h"

@interface MCViewController : UIViewController

@property (nonatomic, strong) UIWebView     *webView;
@property (nonatomic, strong) UIButton      *nextButton;
@property (nonatomic, strong) UIImageView   *backgroundImageView;
@property (nonatomic, strong) UIView        *helpView;

@property (nonatomic, strong) NSString      *webViewString;
@property (nonatomic, strong) NSString      *nextButtonImageString;
@property (nonatomic, strong) NSString      *backgroundImageString;
@property (nonatomic, strong) NSString      *changeImageString;

@property (nonatomic, strong) id data;

@property (nonatomic, assign) dispatch_queue_t dataQueue;
@property (nonatomic, assign) dispatch_group_t dataGroup;
@property (nonatomic, assign) dispatch_once_t pred;


- (id)initWithData:(id)aData;

- (void)createNextButton;
- (void)createWebView;
- (void)createWebViewShow:(WebViewDisable)disableTag;
- (void)createBackGroundView;
- (void)createContentView;
- (void)createHelpView;

- (void)nextButtonAction:(UIButton *)sender;

//在初始化开创子线程，子类继承此方法加载数据
- (void)toBackAddData;
//subviews加载完后，子类继承此方法加载数据
- (void)toMainLoadData;

- (void)backupView:(UIView *)aView;

- (void)viewDidAppearAnimation;
- (void)viewDisappearAnimation:(void (^)(BOOL finished))animation;

@end
