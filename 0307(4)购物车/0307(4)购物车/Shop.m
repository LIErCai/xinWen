//
//  Shop.m
//  0307(4)购物车
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "Shop.h"

@implementation Shop
+ (instancetype)shopWithDict:(NSDictionary *)dict
{
    Shop *shop = [[Shop alloc] init];
    [shop setValuesForKeysWithDictionary:dict];
    return shop;
}

@end
