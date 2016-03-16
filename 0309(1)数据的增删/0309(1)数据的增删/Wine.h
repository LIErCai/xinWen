//
//  Wine.h
//  0309(1)数据的增删
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *name;

+ (instancetype)wineWithDict:(NSDictionary *)dict;

@end
