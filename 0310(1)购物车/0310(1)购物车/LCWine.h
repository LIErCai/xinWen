//
//  LCWine.h
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCWine : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int count;

+ (instancetype)wineWithDict:(NSDictionary *)dict;

@end
