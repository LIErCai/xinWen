//
//  ViewController.m
//  Super
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@ %@ %@ %@",[self class], [self superclass], [super class], [super superclass]);
   /*
    1. class : 调用当前类;
    2. superClass : 获取当前方法调用者的父类;
    3. super : 仅仅是编译指示器, 本质 是让当前对象调用父类方法,
    
    
    宏 与 const
    1.宏是预编译, const 是编译;
    2. 宏没有编译检查, const有编译检查;
    3. 宏可以定义函数.方法; const不可以;
    4. 大量使用宏导致预编译时间过长;
    5. 被const修饰的变量只读;
    6. const修饰全局变量, 可代替宏, 只读;
    
    
    static 
    1. 修饰局部变量, 被static修饰的局部变量,可延长生命周期,跟整个应用程序有关;
    2. static修饰的变量, 只会在程序运行时分配一次内存;
    3. 修饰全局变量, 作用域会修改, 只能在当前文件下使用;
    
    extern:
     用于声明外部全局变量, 只能声明, 不能用于定义;
     工作原理:  现在当前文件中查找有没有对应的全局变量, 如果没有才去其他文件中查找;
    
    
    */
    
    
}

@end
