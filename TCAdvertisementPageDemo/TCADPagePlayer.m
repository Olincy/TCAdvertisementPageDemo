//
//  TCADPagePlayer.m
//  TCAdvertisementPageDemo
//
//  Created by lincy on 16/4/25.
//  Copyright © 2016年 lincy. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "TCADPagePlayer.h"
#import "TCADViewController.h"

const void *associatedKeyAdPlayer = "associatedKeyAdPlayer";

@interface TCADPagePlayer ()

@property (nonatomic, strong) UIWindow *adWindow;
@property (nonatomic, weak) UIWindow *mainWindow;

@end

@implementation TCADPagePlayer

+ (void)showAdPageFullScreen {
    TCADPagePlayer *adPlaer =  [[self alloc]init];
    
    [adPlaer showAdPage];
    
    objc_setAssociatedObject([UIApplication sharedApplication], associatedKeyAdPlayer, adPlaer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)hideAdPageFullScreen {
    TCADPagePlayer *adPlaer =  objc_getAssociatedObject([UIApplication sharedApplication], associatedKeyAdPlayer);
    [adPlaer hideAdPage];
    objc_setAssociatedObject([UIApplication sharedApplication], associatedKeyAdPlayer, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showAdPage {
    TCADViewController *adVC = [[TCADViewController alloc]init];
    adVC.view.backgroundColor = [UIColor yellowColor];
    self.adWindow.rootViewController = adVC;
    
    self.mainWindow = [UIApplication sharedApplication].keyWindow;
    [self.adWindow makeKeyAndVisible];
}

- (void)hideAdPage {
    [self.mainWindow makeKeyAndVisible];
}

- (UIWindow *)adWindow {
    if (_adWindow == nil) {
        _adWindow = [[UIWindow alloc]init];
        _adWindow.frame = [UIScreen mainScreen].bounds;
    }
    return _adWindow;
}

- (void)dealloc {
    NSLog(@"dealloc...");
}

@end
