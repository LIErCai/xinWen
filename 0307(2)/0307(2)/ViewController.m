//
//  ViewController.m
//  0307(2)
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setTitle:@"开始动画" forState:UIControlStateNormal];
    startBtn.frame = CGRectMake(30, 100, 100, 30);
    [startBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(beginAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    
    UIButton *endBtn = [[UIButton alloc] init];
    [endBtn setTitle:@"结束动画" forState:UIControlStateNormal];
    endBtn.frame = CGRectMake(30, 130, 100, 30);
    [endBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [endBtn addTarget:self action:@selector(endAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:endBtn];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(30, 170, 300, 300);
    imageView.image = [UIImage imageNamed:@"1"];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    
    
}

- (void)beginAnimation
{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 20; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", i+1]];
        [images addObject:image];
    }
    self.imageView.animationImages = images;
    self.imageView.animationRepeatCount = 0;
    self.imageView.animationDuration = 1.0;
    [self.imageView startAnimating];
}

- (void)endAnimation
{
    [self.imageView stopAnimating];
//    self.imageView.animationImages = nil;
}
@end
