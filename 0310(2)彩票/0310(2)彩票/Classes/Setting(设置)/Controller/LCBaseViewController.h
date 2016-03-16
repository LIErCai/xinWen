//
//  LCBaseViewController.h
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//
#import "LCSettingSwithItem.h"
#import "LCSettingAccessoryItem.h"
#import "LCSettingCell.h"
#import "LCSettingItemGroup.h"
#import <UIKit/UIKit.h>

@interface LCBaseViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *itemGroups;
@end
