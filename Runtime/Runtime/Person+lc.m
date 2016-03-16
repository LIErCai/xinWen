//
//  Person+lc.m
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "Person+lc.h"
#import <objc/message.h>
@implementation Person (lc)

- (void)setAge:(NSNumber *)age
{
    objc_setAssociatedObject(self, @"age", age, OBJC_ASSOCIATION_ASSIGN);
   
}

- (NSNumber *)age
{
    return objc_getAssociatedObject(self, @"age");
    
    
}
@end
