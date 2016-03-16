//
//  LCSettingCell.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCSettingCell.h"
#import "LCSettingItem.h"
#import "LCSettingSwithItem.h"
#import "LCSettingAccessoryItem.h"
@implementation LCSettingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    NSString *ID = @"cell";
    LCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LCSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
   
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView style:UITableViewCellStyleDefault];
}
- (void)setItem:(LCSettingItem *)item
{
    _item = item;
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    if ([item isKindOfClass:[LCSettingAccessoryItem class]])
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        [imageView sizeToFit];
        self.accessoryView = imageView;
    }
   else if([item isKindOfClass:[LCSettingSwithItem class]])
    {
        LCSettingSwithItem *swItem = (LCSettingSwithItem *)item;
        UISwitch *sw = [[UISwitch alloc] init];
        [sw sizeToFit];
        sw.on = swItem.open;
        self.accessoryView = sw;
//
    }else
    {
        self.accessoryView = nil;
    }
    
}
    
@end
