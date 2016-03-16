//
//  ViewController.m
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import  <objc/message.h>
#import "Person+lc.h"
#import "NSDictionary+lc.h"
#import "LCStatus.h"
#import "NSObject+Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    1. runtime: 必须导入头文件<objc/message.h>;
     2. 方法调用的本质: 发送一个消息, 用runtime发送消息, oc底层实现通过runtime实现
     3. 类方法本质: 类对象调用; ios6之后官方不推荐使用runtime;
     4. 方法调用流程: 通过isa指针到方法区中查找, 对象方法在类对象的方法列表中,
        类方法在元类方法列表中; 注册方法编号, 根据方法编号去查找对应方法,找到最终函数实现地址
        根据地址去方法去调用对应函数
     5. runtime动态添加方法:OC 都是懒加载机制, 只要一个方法实现了,就会马上添加到方法列表中
     */
//
    NSString *fullePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:fullePath];
    
    LCStatus *status = [LCStatus modelWithDict:dict];
    NSLog(@"%@", status.user);
    
//    [dict[@"user"] createPropertyCode];
}
/**
 *  动态添加属性(分类中)
 */
- (void)test2
{
    Person *p = [[Person alloc] init];
    p.age = @15;
    NSLog(@"%@", p.age);
}
- (void)test1
{
//    Person *person = [[Person alloc] init];
    //    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    //    p = objc_msgSend(p, sel_registerName("init"));
    //
    ////    [person eat];
    //    objc_msgSend(p, sel_registerName("eat"));
    //
    //    [self test];
    //    [self addImage];
    
//    Person  *p = [[Person alloc] init];
    
//    [p performSelector:@selector(run:) withObject:@(30)];
}
- (void)image
{
//    UIImage *image = [UIImage imageNamed:@"222.jpg"];
}

/**
 *  方法交换
 */
- (void)addImage
{
//    UIImage *image = [UIImage imageNamed:@"2.png"];
}
/**
 *  消息机制
 */
- (void)test
{
    Person *person = objc_msgSend([Person class], @selector(alloc));
    person = objc_msgSend(person, @selector(init));
//    objc_msgSend(person, @selector(eat));
//    objc_msgSend(person, @selector(run:), 30);
}

@end
