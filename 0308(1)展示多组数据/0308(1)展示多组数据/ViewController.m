//
//  ViewController.m
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCCarGroup.h"
#import "LCCar.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *groups;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionIndexColor = [UIColor redColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor blackColor];
}

- (NSArray *)groups{
    if (_groups == nil)
    {
        NSString *file = [[NSBundle mainBundle] pathForResource:@"cars.plist" ofType:nil];
        NSArray *carsArr = [NSArray arrayWithContentsOfFile:file];
        NSMutableArray *groups = [NSMutableArray array];
        for (NSDictionary *dict in carsArr)
        {
            LCCarGroup *group = [LCCarGroup carGroupWithDict:dict];
            [groups addObject:group];
        }
        
        _groups = groups;
    }
    return _groups;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LCCarGroup *group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    LCCarGroup *group = self.groups[indexPath.section];
    LCCar *car = group.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LCCarGroup *group = self.groups[section];
    return group.title;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *titles = [NSMutableArray array];
    for (LCCarGroup *group in self.groups)
    {
        [titles addObject: group.title];
    }
    return titles;
}
@end
