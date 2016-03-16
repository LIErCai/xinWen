//
//  Person.m
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person

/*- (void)eat
{
    NSLog(@"eat");
}

- (void)run:(NSInteger)metre
{
    NSLog(@"跑了%zd",metre);
}*/
void test(id self, SEL _cmd, NSNumber *metre)
{
    NSLog(@"跑了%@", metre);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"run:"))
    {
        class_addMethod(self, sel, (IMP) test, "v@:@");
        return YES;
    }
        return [super resolveInstanceMethod:sel];
}

- (void)test:(SEL)sel
{
    if (sel == NSSelectorFromString(@"eat"))
    {
        /**
         *  添加要实现的方法
         *
         *  @param self 要添加方法的类
         *  @param sel  要添加的方法
         *  @param IMP  方法调用的函数
         *
         *  @return 方法类型
         */
        class_addMethod(self, sel, (IMP)test, "v@:");
       
    }

}
@end
