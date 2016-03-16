//
//  Wine.m
//  0309(1)数据的增删
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "Wine.h"

@implementation Wine

+ (instancetype)wineWithDict:(NSDictionary *)dict
{
    Wine *wine = [[self alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    return wine;
}
@end
