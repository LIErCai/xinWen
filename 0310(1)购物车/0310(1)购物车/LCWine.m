//
//  LCWine.m
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCWine.h"

@implementation LCWine

+ (instancetype )wineWithDict:(NSDictionary *)dict
{
    LCWine *wine = [[LCWine alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    
    return wine;
}
@end
