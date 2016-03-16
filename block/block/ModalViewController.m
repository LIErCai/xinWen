
//
//  ModalViewController.m
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.name = @"jjjj";
//    if (_block)
//    {
//        _block(self.name);
//    }
    
    
    __weak typeof (self) weakSelf = self;
    NSLog(@"%@", self);
    _block = ^()
    {
        __strong typeof (weakSelf)strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@", strongSelf);
        });
        
    };
    _block();
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end