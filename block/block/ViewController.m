//
//  ViewController.m
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "CacultorManager.h"
@interface ViewController ()

@property (nonatomic, strong) NSString *imageName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     block 是一个对象;
     1. 判断MRC与ARC的标准:
        1> dealloc中能否调用super,只有MRC才能调用super;
        2> 能否使用retain,release, 如果能调用就是MRC;
     2. ARC管理原则: 只要一个对象没有强指针修饰就会被销毁,默认局部变量对象都是强指针, 放在堆里;
     3. MRC常识: 没有strong ,weak;局部变量相当于基本数据类型;
        MRC给属性赋值,一定使用set方法,不能直接访问下划线成员属性赋值;
     4.MRC管理block:
        1>只要block没有引用外部变量,就放在全局区;
        2>只要block引用外部变量,block放在栈里;
     block只能使用copy,不能使用retain;使用retain, block还是放在栈里;
     
     5.ARC管理block:
        1>只要没有引用外部变量,就放在全局区;
        2> 只要引用了外部修饰的变量,就放在堆中;
        block使用strong, 不要使用copy;
     
     6. 如果是局部变量,block是值传递;
     7. 如果是静态变量,全局变量,__block修饰变量,block就是地址传递;
     */
    CacultorManager *mgr = [[CacultorManager alloc] init];
    [mgr cacultor:^NSInteger(NSInteger result) {
        result = 5;
        return result;
    }];
    NSLog(@"%ld", mgr.result);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ModalViewController *vc = [[ModalViewController alloc] init];
    vc.view.backgroundColor = [UIColor magentaColor];
    vc.block = ^(NSString *value)
    {
        self.imageName = value;
        NSLog(@"%@", self.imageName);
    };
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)test
{
    // 声明:
    void(^block)();
    
    //2. 定义
    void(^block1)() = ^{
        NSLog(@"block1");
    };
    
    void(^block2)() = ^()
    {
        NSLog(@"block2");
    };
    
    void(^block3)() = ^void{
        NSLog(@"block3");
    };
    //3. 调用
    block1();
    block2();
    block3();

}
@end
