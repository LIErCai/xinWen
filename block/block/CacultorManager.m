//
//  CacultorManager.m
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "CacultorManager.h"

@implementation CacultorManager

- (void)cacultor:(NSInteger(^)(NSInteger))cacultorBlock
{
    if (cacultorBlock)
    {
        _result = cacultorBlock(_result);
    }
}
@end
