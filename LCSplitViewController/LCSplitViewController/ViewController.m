//
//  ViewController.m
//  LCSplitViewController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCFoodsViewController.h"
#import "LCFoodTypeTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *foodTypeNav = [self.viewControllers firstObject];
    LCFoodTypeTableViewController *foodTypesVc = [foodTypeNav.viewControllers firstObject];
    
    UINavigationController *foodsNav = [self.viewControllers lastObject];
    LCFoodsViewController <UISplitViewControllerDelegate>*foodsVc = [foodsNav.viewControllers firstObject];
    
    foodTypesVc.foodType = ^(LCFoodType *foodTye){
        foodsVc.foodType = foodTye;
    };
    
    self.delegate = foodsVc;
}


@end
