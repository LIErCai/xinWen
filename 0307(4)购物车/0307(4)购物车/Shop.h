//
//  Shop.h
//  0307(4)购物车
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)shopWithDict:(NSDictionary *)dict;
@end
