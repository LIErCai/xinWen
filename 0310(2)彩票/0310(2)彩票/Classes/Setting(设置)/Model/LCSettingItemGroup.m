//
//  LCSettingItemGroup.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCSettingItemGroup.h"
#import "LCSettingItem.h"
@implementation LCSettingItemGroup
+ (instancetype)itemGroupWithitems:(NSArray *)items
{
    LCSettingItemGroup *itemGroup = [[LCSettingItemGroup alloc] init];
    
       itemGroup.items = items;
    return itemGroup;
}
@end
