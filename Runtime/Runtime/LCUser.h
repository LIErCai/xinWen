//
//  LCUser.h
//  Runtime
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCUser : NSObject
@property (nonatomic, strong) NSString *profile_image_url;

@property (nonatomic, assign) BOOL vip;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) NSInteger mbrank;

@property (nonatomic, assign) NSInteger mbtype;

@end
