//
//  LCFoodsViewController.m
//  LCSplitViewController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCFoodsViewController.h"
#import "MJExtension.h"
#import "LCFoodItem.h"
#import "LCFoodType.h"
#import "LCFoodDetailViewController.h"
@interface LCFoodsViewController ()<UISplitViewControllerDelegate>

@property (nonatomic, strong) NSArray *foods;

@end

@implementation LCFoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"菜系";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}
//- (NSArray *)foods
//{
//    if (_foods == nil)
//    {
//       
//    }
//    return _foods;
//}

- (void)setFoodType:(LCFoodType *)foodType
{
    _foodType = foodType;
    NSString *fileName = [NSString stringWithFormat:@"type_%@_foods.plist", self.foodType.idstr];
    self.foods = [LCFoodItem mj_objectArrayWithFilename:fileName];
    [self.tableView reloadData];
    self.title = self.foodType.name;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    LCFoodItem *item = self.foods[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"难度：%@  时间：%@", item.diff, item.time];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCFoodItem *foodItem = self.foods[indexPath.row];
    LCFoodDetailViewController *detailVc = [[LCFoodDetailViewController alloc] init];
    detailVc.foodItem = foodItem;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detailVc];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
}
@end
