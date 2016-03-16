//
//  LCWine.m
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCWine.h"

@implementation LCWine
+ (instancetype)wineWithDict:(NSDictionary *)dict
{
    LCWine *wine = [[LCWine alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    return wine;
}
@end
