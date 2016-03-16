//
//  LCHallTableViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCHallTableViewController.h"
#import "LCPopView.h"
#import "LCCover.h"
#import "UIImage+lc.h"
@interface LCHallTableViewController ()

@end

@implementation LCHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginal:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarOnClicked)];
   
}

- (void)leftBarOnClicked
{
    [LCCover show];
    LCPopView *popView = [LCPopView showInCenter:self.view.center];
    popView.completion = ^{
        [LCCover hidden];
    };
}


@end
