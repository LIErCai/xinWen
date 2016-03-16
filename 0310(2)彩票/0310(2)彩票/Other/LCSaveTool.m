//
//  LCSaveTool.m
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCSaveTool.h"

@implementation LCSaveTool
+ (id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
  
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    if (defaultName)
    {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
