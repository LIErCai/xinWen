//
//  LCStatus.h
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCStatus : NSObject

@property (nonatomic, strong) NSString *source;

@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, assign) NSArray *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) BOOL isA;

@property (nonatomic, assign) NSInteger attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, assign) NSDictionary *user;

//+ (instancetype)statusWithDict:(NSDictionary *)dict;
@end
