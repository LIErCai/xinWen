//
//  LCSettingItemGroup.h
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCSettingItemGroup : NSObject

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *footer;

+ (instancetype)itemGroupWithitems:(NSArray *)items;
@end
