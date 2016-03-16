//
//  LCTabBarController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCTabBarController.h"
#import "LCTabView.h"
#import "LCNavigationController.h"
#import "LCArenaNavigationController.h"

#import "LCHallTableViewController.h"
#import "LCArenaViewController.h"
#import "LCDiscoverTableViewController.h"
#import "LCHistoryTableViewController.h"
#import "LCMyLotterViewController.h"

#import "UIImage+lc.h"
@interface LCTabBarController ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation LCTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for ( UIView *view in self.tabBar.subviews)
    {
        if (![view isKindOfClass:[LCTabView class]])
        {
            [view removeFromSuperview];
        }
    }
   
}
- (NSMutableArray *)items
{
    if (_items == nil)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 添加子控制器
    [self setupAllChilderController];
    //2. 设置tabView;
    [self setupTabView];
    
    
}
/**
 *  设置tabView
 */
- (void)setupTabView
{
    LCTabView *tabView = [[LCTabView alloc] init];
    tabView.frame = self.tabBar.bounds;
    tabView.backgroundColor = [UIColor blackColor];
    tabView.items = self.items;
    tabView.buttonBlock = ^(UIButton *button)
    {
        self.selectedIndex = button.tag;
    };
    [self.tabBar addSubview:tabView];
}
/**
 *  添加子控制器
 */
- (void)setupAllChilderController
{
    LCHallTableViewController *hall = [[LCHallTableViewController alloc] init];
    hall.title = @"购彩大厅";
    [self setupOneChilerContoller:hall Image:[UIImage imageWithOriginal:@"TabBar_Hall_new"] selImage:[UIImage imageWithOriginal:@"TabBar_Hall_selected_new"]];
    
    LCArenaViewController *arena = [[LCArenaViewController alloc] init];
    arena.title = @"竞技场";
    [self setupOneChilerContoller:arena Image:[UIImage imageWithOriginal:@"TabBar_Arena_new"] selImage:[UIImage imageWithOriginal:@"TabBar_Arena_selected_new"]];
    
    LCDiscoverTableViewController *disc = [[LCDiscoverTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    disc.title = @"发现";
    [self setupOneChilerContoller:disc Image:[UIImage imageWithOriginal:@"TabBar_Discovery_new"] selImage:[UIImage imageWithOriginal:@"TabBar_Discovery_selected_new"]];
    
    LCHistoryTableViewController *hist = [[LCHistoryTableViewController alloc] init];
    hist.title = @"开奖信息";
    [self setupOneChilerContoller:hist Image:[UIImage imageWithOriginal:@"TabBar_History_new"] selImage:[UIImage imageWithOriginal:@"TabBar_History_selected_new"]];
    
    LCMyLotterViewController *my = [[LCMyLotterViewController alloc] init];
    my.title = @"我的彩票";
    [self setupOneChilerContoller:my Image:[UIImage imageWithOriginal:@"TabBar_MyLottery_new"] selImage:[UIImage imageWithOriginal:@"TabBar_MyLottery_selected_new"]];
    
    
}

- (void)setupOneChilerContoller:(UIViewController *)vc Image:(UIImage *)image selImage:(UIImage *)selImage
{
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    UINavigationController *nav = [[LCNavigationController alloc] initWithRootViewController:vc];
    if ([vc isKindOfClass:[LCArenaViewController class]])
    {
       nav = [[LCArenaNavigationController alloc] initWithRootViewController:vc];
    }
    [self.items addObject:vc.tabBarItem];
    [self addChildViewController:nav];

}
@end
