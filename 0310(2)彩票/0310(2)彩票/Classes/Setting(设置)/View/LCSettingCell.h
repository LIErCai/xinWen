//
//  LCSettingCell.h
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCSettingItem;
@interface LCSettingCell : UITableViewCell

@property (nonatomic, strong) LCSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
