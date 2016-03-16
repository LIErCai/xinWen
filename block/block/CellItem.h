//
//  CellItem.h
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) void(^block)();

//+ (instancetype)cellItemWithTitle:(NSString *)title;
@end
