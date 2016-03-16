//
//  LCWine.h
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCWine : NSObject

@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *money;

+ (instancetype)wineWithDict:(NSDictionary *)dict;

@end
