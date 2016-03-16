//
//  LCDiscoverTableViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCDiscoverTableViewController.h"
#import "LCBuyViewController.h"
#import "LCDisCell.h"
#import "UIView+LC.h"
@interface LCDiscoverTableViewController ()

@end

@implementation LCDiscoverTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *ID = @"cell";
    LCDisCell *cell = [LCDisCell cellWithTable:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LCBuyViewController *buyVC = [[LCBuyViewController alloc] init];
        buyVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:buyVC animated:YES];
    }
}
@end
