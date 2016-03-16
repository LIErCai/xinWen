//
//  LCSettingItem.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCSettingItem.h"

@implementation LCSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle
{
    LCSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    return [self itemWithImage:image title:title subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithImage:nil title:title];
}
@end
