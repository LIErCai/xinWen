//
//  LCCarGroup.m
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCCarGroup.h"
#import "LCCar.h"
@implementation LCCarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    LCCarGroup *carGroup = [[LCCarGroup alloc] init];
    carGroup.title = dict[@"title"];
    
    NSMutableArray *cars = [NSMutableArray array];
   for (NSDictionary *carDict in dict[@"cars"])
   {
       [cars addObject:[LCCar carWithDict:carDict]];
   }
    carGroup.cars = cars;
    return carGroup;
}
@end
