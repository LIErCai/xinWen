//
//  LCBaseViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCBaseViewController.h"
@interface LCBaseViewController()


@end
@implementation LCBaseViewController

- (NSMutableArray *)itemGroups
{
    if (_itemGroups == nil)
    {
        _itemGroups = [NSMutableArray array];
    }
    return _itemGroups;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.itemGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LCSettingItemGroup *group = self.itemGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCSettingCell *cell = [LCSettingCell cellWithTableView:tableView];
    LCSettingItemGroup *group = self.itemGroups[indexPath.section];
    LCSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCSettingItemGroup *group = self.itemGroups[indexPath.section];
    LCSettingItem *item = group.items[indexPath.row];
    if (item.operation)
    {
        item.operation(indexPath);
    }else if([item isKindOfClass:[LCSettingAccessoryItem class]])
    {
        LCSettingAccessoryItem *arrowItem = (LCSettingAccessoryItem *)item;
        if (arrowItem.desVc)
        {
            UIViewController *vc = [[arrowItem.desVc alloc] init];
            vc.title = arrowItem.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LCSettingItemGroup *group = self.itemGroups[section];
    return group.header;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LCSettingItemGroup *group = self.itemGroups[section];
    return group.footer;
}
@end
