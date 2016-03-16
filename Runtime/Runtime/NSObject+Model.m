//
//  NSObject+lc.m
//  Runtime
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>
@implementation NSObject (Model)
/**
  1.  KVC 实现原理 : 遍历字典中的所有key, 给模型中的所有属性赋值,
  2.  setValue:value  forKey:@"key"
    1> 先去模型中找有没有setKey, 找到就直接调用赋值;
    2> 找有没有key属性, 有直接赋值;
    3> 找有没有_key属性, 有直接访问赋值;
    4> 找不到就直接 setValue:forUnderfinedkey报错;
 3. MJExtension: 遍历模型中的所有属性,在字典中找对应的key赋值;
 */

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    //1. 获取成员变量数组
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivarList[i];
//        NSLog(@"%@", ivar);
        //2. 获取变量名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        NSLog(@"%@", ivarName);
        
        //2.1 判断类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
//        NSLog(@"%@", ivarType);
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
         NSLog(@"%@", ivarType);
        //3. 获取key
        NSString *key = [ivarName substringFromIndex:1];
        
        id value = dict[key];
        
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"])
        {
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass modelWithDict:value];
        }
        if (value)
        {
            [obj setValue:value forKey:key];
        }
    }
    
    return obj;
}
@end
