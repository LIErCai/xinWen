//
//  TitleViewController.m
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "TitleViewController.h"
#import "TitleItem.h"
@interface TitleViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake(150, 44 * self.items.count);
}

- (NSArray *)items{
    if (_items == nil)
    {
        TitleItem *item1 = [TitleItem itemWithIcon:@"movie" title:@"电影"];
        TitleItem *item2 = [TitleItem itemWithIcon:@"music" title:@"音乐"];
        TitleItem *item3 = [TitleItem itemWithIcon:@"video" title:@"电影"];
        _items = @[item1, item2, item3];

    }
    return _items;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    TitleItem *item = self.items[indexPath.row];
    
    cell.imageView.image =  [UIImage imageNamed:item.icon];
    cell.textLabel.text = item.title;
    
    return cell;
}
@end
