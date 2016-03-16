//
//  ViewController.m
//  0307(3)帧动画
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *standBtn = [[UIButton alloc] init];
    [standBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [standBtn setTitle:@"站立" forState:UIControlStateNormal];
    standBtn.frame = CGRectMake(30, 30, 50, 50);
    [standBtn addTarget:self action:@selector(stand) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:standBtn];
    
    UIButton *dazhaoBtn = [[UIButton alloc] init];
    [dazhaoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dazhaoBtn setTitle:@"大招" forState:UIControlStateNormal];
    dazhaoBtn.frame = CGRectMake(200, 30, 50, 50);
    [dazhaoBtn addTarget:self action:@selector(dazhao) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dazhaoBtn];
    
    UIImageView  *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(30, 100, 300, 300);
    imageView.contentMode = UIViewContentModeBottomLeft;
    self.imageView = imageView;
    [self.view addSubview:imageView];
    [self stand];
}

- (void)stand
{
    [self play:@"stand" count:10];
//    
//    NSMutableArray *standArr = [NSMutableArray array];
//    for (int i = 0; i < 10; i++)
//    {
//        NSString *fileName = [NSString stringWithFormat:@"stand_%d", i+1];
//        NSString *file = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
//        UIImage *image = [UIImage imageWithContentsOfFile:file];
//    
//        [standArr addObject:image];
//    }
//    self.imageView.animationImages = standArr;
//    self.imageView.animationDuration = 1.0;
//    self.imageView.animationRepeatCount = 0;
//    [self.imageView startAnimating];
}

- (void)dazhao
{
//    NSMutableArray *images = [NSMutableArray array];
//    for (int i = 0; i < 87; i++)
//    {
//        NSString *fileName = [NSString stringWithFormat:@"dazhao_%d", i+1];
//        NSString *file = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
//        UIImage *image = [UIImage imageWithContentsOfFile:file];
//        [images addObject:image];
//    }
//    self.imageView.animationImages = images;
//    self.imageView.animationDuration = images.count * 0.04;
//    self.imageView.animationRepeatCount = 1;
//    [self.imageView startAnimating];
//    [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
//    [self stand];
    
    [self play:@"dazhao" count:87];
}

- (void)play:(NSString *)fileNamePrefix count:(int)count
{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < count; i++)
    {
        NSString *fileName = [NSString stringWithFormat:@"%@_%d", fileNamePrefix, i+1];
        NSString *file = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:file];
        [images addObject:image];
    }
    self.imageView.animationImages = images;
    self.imageView.animationRepeatCount = [fileNamePrefix isEqualToString:@"stand"] ? 0 : 1;
    self.imageView.animationDuration = count * 0.08;
    [self.imageView startAnimating];
    if ([fileNamePrefix isEqualToString:@"stand"]) return;
    
    [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    
}

@end
