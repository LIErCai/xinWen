//
//  ViewController.m
//  父子控制器
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCHotViewController.h"
#import "LCTopViewController.h"
#import "LCScoietyViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //1. 添加所有自控制器
    [self setupAllViewController];
    
    //2. 设置按钮内容
    [self setupTitleButton];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
}
- (IBAction)titleButtonClicked:(UIButton *)sender {
    UIViewController *vc = self.childViewControllers[sender.tag];
    vc.view.backgroundColor = sender.backgroundColor;
    vc.view.frame = self.contentView.bounds;
    NSLog(@"%f, %f", vc.view.frame.origin.x, vc.view.frame.origin.y);
    [self.contentView addSubview:vc.view];
    
    NSLog(@"%f, %f", self.contentView.frame.origin.x, self.contentView.frame.origin.y);
}
/**
 *  设置按钮内容
 */
- (void)setupTitleButton
{
    for (int i = 0; i < self.titleView.subviews.count; i++) {
        UIButton *button = self.titleView.subviews[i];
        UIViewController *vc = self.childViewControllers[i];
        [button setTitle:vc.title forState:UIControlStateNormal];
    }
}
/**
 *  添加所有子控制器
 */
- (void)setupAllViewController
{
    LCScoietyViewController *scoiet = [[LCScoietyViewController  alloc] init];
   scoiet.title = @"社会";
    [self addChildViewController:scoiet];
    
    LCTopViewController *top = [[LCTopViewController alloc] init];
    top.title = @"头条";
    [self addChildViewController:top];
    
    LCHotViewController *hot = [[LCHotViewController alloc] init];
    hot.title  = @"热点";
    [self addChildViewController:hot];
}
@end
