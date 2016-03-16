//
//  WineViewController.m
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "WineViewController.h"
#import "LCWine.h"
@interface WineViewController ()

@property (nonatomic, strong)NSArray *wines;

@end

@implementation WineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 100;
//     self.tableView.tableHeaderView = [[UISwitch alloc] init];
}

- (NSArray *)wines{
    if (_wines == nil)
    {
        NSString *file = [[NSBundle mainBundle] pathForResource:@"wine.plist"ofType:nil];
        NSArray *wineArr = [NSArray arrayWithContentsOfFile:file];
        NSMutableArray *wines = [NSMutableArray array];
        for (NSDictionary *dict in wineArr)
        {
            LCWine *wine = [LCWine wineWithDict:dict];
            [wines addObject:wine];
        }
        _wines = wines;
    }
    return _wines;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    LCWine *wine = self.wines[indexPath.row];
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.money;
    cell.imageView.image = [UIImage imageNamed:wine.image];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UISwitch alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UISwitch alloc] init];
}
@end
