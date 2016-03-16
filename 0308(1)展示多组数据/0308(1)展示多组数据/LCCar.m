//
//  LCCar.m
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCCar.h"

@implementation LCCar
+ (instancetype)carWithDict:(NSDictionary *)dict
{
    LCCar *car = [[LCCar alloc] init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    
    return car;
}
@end
