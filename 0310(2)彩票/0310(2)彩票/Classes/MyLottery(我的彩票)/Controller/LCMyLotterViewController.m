//
//  LCMyLotterViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCMyLotterViewController.h"

#import "LCLoginViewController.h"
#import "LCSettingViewController.h"
#import "UIView+LC.h"
#import "UIImage+lc.h"
@interface LCMyLotterViewController ()

@end

@implementation LCMyLotterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupItems];
    [self setupImageView];
    [self setupLoginBtn];
}
/**
 *  设置导航条内容
 */
- (void)setupItems
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [button setTitle:@"客服" forState:UIControlStateNormal];
    [button sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:  button];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(rightbarbuttonClicked)];

}
/**
 *  设置view内容
 */
- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"LoginScreen"]];
    imageView.frame = CGRectMake(0, 0, 296, 189);
    imageView.center = CGPointMake(self.view.center.x , self.view.height * 0.2);
    [self.view addSubview:imageView];
}
/**
 *  设置登录按钮
 */
- (void)setupLoginBtn
{
    UIButton *logBtn = [[UIButton alloc] init];
    [logBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logBtn setBackgroundImage:[UIImage stretchImageName:@"RedButton"] forState:UIControlStateNormal];
    logBtn.frame = CGRectMake(0, 0, 300, 30);
    logBtn.center = CGPointMake(self.view.center.x, self.view.height * 0.5);
    [logBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:logBtn];

}

- (void)login
{
    LCLoginViewController *loginVc = [[LCLoginViewController alloc] init];
    [self.navigationController presentViewController:loginVc animated:YES completion:nil];
}
- (void)rightbarbuttonClicked
{
    LCSettingViewController *setVc = [[LCSettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:setVc animated:YES];
}

@end
