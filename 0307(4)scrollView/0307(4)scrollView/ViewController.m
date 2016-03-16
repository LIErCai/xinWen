//
//  ViewController.m
//  0307(4)scrollView
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCPageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LCPageView *pageView = [LCPageView pageView];
    pageView.imageNames = @[@"img_01", @"img_02", @"img_03", @"img_04",@"img_05"];
    pageView.frame = CGRectMake(10, 100, 320, 200);
//    pageView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:pageView];
}

@end
