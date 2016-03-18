

//
//  LCFoodTypeTableViewController.m
//  LCSplitViewController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCFoodTypeTableViewController.h"
#import "LCFoodType.h"
#import "MJExtension.h"
@interface LCFoodTypeTableViewController ()

@property (nonatomic, strong) NSArray *foodTypes;

@end

@implementation LCFoodTypeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"菜系";
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

- (NSArray  *)foodTypes
{
    if (_foodTypes == nil)
    {
        _foodTypes = [LCFoodType mj_objectArrayWithFilename:@"food_types.plist"];
    }
    return _foodTypes;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.foodTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    LCFoodType *foodType = self.foodTypes[indexPath.row];
    cell.textLabel.text = foodType.name;
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCFoodType *foodType = self.foodTypes[indexPath.row];
    if (_foodType)
    {
        _foodType(foodType);
    }
}
@end
