//
//  LCArenaViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCArenaViewController.h"

@interface LCArenaViewController ()

@end

@implementation LCArenaViewController

- (void)loadView{
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgImageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    bgImageView.userInteractionEnabled = YES;
    self.view = bgImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segMentController = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    self.navigationItem.titleView = segMentController;
    
    [segMentController setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segMentController setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    segMentController.selectedSegmentIndex = 0;
    segMentController.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    [segMentController setTitleTextAttributes:@{
                                                NSFontAttributeName : [UIFont systemFontOfSize:15],
                                                NSForegroundColorAttributeName : [UIColor whiteColor]
                                                } forState:UIControlStateNormal];
    
}



@end
