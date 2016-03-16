//
//  LCArenaNavigationController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCArenaNavigationController.h"
#import "UIImage+lc.h"
@implementation LCArenaNavigationController
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage stretchImageName:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
}
@end
