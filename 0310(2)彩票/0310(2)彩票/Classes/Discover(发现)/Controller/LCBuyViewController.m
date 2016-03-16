//
//  LCBuyViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCBuyViewController.h"
#import "LCbuyButton.h"
@interface LCBuyViewController ()

@end

@implementation LCBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LCbuyButton *buyBtn = [[LCbuyButton alloc] init];
    [buyBtn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [buyBtn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [buyBtn sizeToFit];
    self.navigationItem.titleView = buyBtn;
}



@end
