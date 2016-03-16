//
//  LCCover.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCCover.h"

#define LCKeyWindow [UIApplication sharedApplication].keyWindow
@implementation LCCover
+ (void)show
{
    LCCover *cover = [[LCCover alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.7f;
    [LCKeyWindow addSubview:cover];
}
+ (void)hidden
{
    for (UIView *view in LCKeyWindow.subviews)
    {
        if ([view isKindOfClass:[LCCover class]])
        {
            [view removeFromSuperview];
            break;
        }
    }
}
@end
