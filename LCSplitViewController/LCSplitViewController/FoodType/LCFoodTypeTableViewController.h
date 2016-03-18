//
//  LCFoodTypeTableViewController.h
//  LCSplitViewController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCFoodType;
@interface LCFoodTypeTableViewController : UITableViewController

@property (nonatomic, strong) void(^foodType)(LCFoodType *foodType);

@end
