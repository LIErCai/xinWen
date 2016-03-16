//
//  LCRootVc.m
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCRootVc.h"
#import "LCTabBarController.h"
#import "LCNewFeatureController.h"
#import "LCSaveTool.h"
@implementation LCRootVc
+ (UIViewController *)chooseWindowRootVc
{
#define LCVerson @"Verson"
    UIViewController *rootVc;
    NSString *currVerson = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *odlVerson = [LCSaveTool objectForKey:LCVerson];
    
    if ([currVerson isEqualToString:odlVerson])
    {
        rootVc = [[LCTabBarController alloc] init];
    }else
    {
        rootVc = [[LCNewFeatureController alloc] init];
        [LCSaveTool setObject:currVerson forKey:LCVerson];
    }
    return rootVc;
}

@end
