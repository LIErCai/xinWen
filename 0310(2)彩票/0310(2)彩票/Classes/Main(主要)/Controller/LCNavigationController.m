//
//  LCNavigationController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCNavigationController.h"

@interface LCNavigationController()<UIGestureRecognizerDelegate >

@end


@implementation LCNavigationController

+ (void)initialize
{
    if (self == [LCNavigationController class])
    {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        //1. 导航条文字
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
        dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [bar setTitleTextAttributes:dict];
        
        //2. 返回按钮颜色
        bar.tintColor = [UIColor whiteColor];
        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    }
}
- (void)viewDidLoad
{
    [super  viewDidLoad];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view  addGestureRecognizer:pan];
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return  self.childViewControllers.count > 1;
   
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
