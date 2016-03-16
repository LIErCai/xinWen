//
//  LCCarGroup.h
//  0308(1)展示多组数据
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCarGroup : NSObject

@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;


+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
@end
