//
//  ViewController.m
//  TCAdvertisementPageDemo
//
//  Created by lincy on 16/4/25.
//  Copyright © 2016年 lincy. All rights reserved.
//

#import "ViewController.h"
#import "TCADViewController.h"
#import "TCADPagePlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [TCADPagePlayer showAdPageFullScreen];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [TCADPagePlayer hideAdPageFullScreen];
        });
    });
}


@end
