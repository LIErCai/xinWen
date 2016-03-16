//
//  TableViewController.m
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "TableViewController.h"
#import "CellItem.h"
@interface TableViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation TableViewController

- (NSArray *)items
{
    if (_items == nil)
    {
        CellItem *item1 = [[CellItem alloc] init];
        item1.title = @"打电话";
        item1.block = ^{
            NSLog(@"打电话");
        };
        
        CellItem *item2 = [[CellItem alloc] init];
        item2.title = @"发短信";
        item2.block = ^{
            NSLog(@"发短信");
        };
        
        CellItem *item3 = [[CellItem alloc] init];
        item3.title = @"发邮件";
        item3.block = ^{
            NSLog(@"发邮件");
        };
        _items = @[item1, item2, item3];
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    CellItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellItem *item = self.items[indexPath.row];
    item.block();
}
@end
