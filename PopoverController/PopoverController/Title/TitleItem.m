//
//  TitleItem.m
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "TitleItem.h"

@implementation TitleItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    TitleItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}
@end
