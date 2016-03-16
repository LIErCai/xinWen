//
//  CacultorManager.h
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacultorManager : NSObject

@property (nonatomic, assign) NSInteger result;

- (void)cacultor:(NSInteger(^)(NSInteger))cacultorBlock;

@end
