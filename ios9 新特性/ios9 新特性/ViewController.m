//
//  ViewController.m
//  ios9 新特性
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 *  可以为空的
 */
@property (nonatomic, strong, nullable) NSString *name;
@property (nonatomic, strong) NSString *_Nullable name2;
@property (nonatomic, strong) NSString *__nullable name3;
/**
 *  不能为空的
 */
@property (nonatomic, strong, nonnull) NSString *name4;
@property (nonatomic, strong)NSString *_Nonnull name5;
@property (nonatomic, strong) NSString *__nonnull name6;
/**
 *  set可空, get 不能为空
 */
@property (nonatomic, strong, null_resettable) NSString *name7;
@property (nonatomic, strong) NSString *name8;

@property (nonatomic, strong) NSMutableArray<NSString *> *arr;


@end

@interface Person<__contravariant ObjectType> : NSObject
@property (nonatomic, strong) ObjectType language;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /*
    
   1. 关键字注意点  :
      不能用于基本数据类型,只能用于对象
    2. 泛型:
     1> 限制类型; 2> 提高代码规范, 减少沟通成本,从数组取出来,可以使用点语法
     3> 用于限制集合类型
    
    3. __covariant:协变,  子类转父类
      __
    */
}

+ (__kindof ViewController *)viewController
{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
