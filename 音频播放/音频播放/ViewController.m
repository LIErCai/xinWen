//
//  ViewController.m
//  音频播放
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "LCAudioTool.h"
@interface ViewController ()

@property (nonatomic, assign) SystemSoundID soundID;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [LCAudioTool playSound:@"buyao.wav"];
    [LCAudioTool playSound:@"m_03.wav"];
}

- (void)test
{
    SystemSoundID soundID;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"buyao.wav" withExtension:nil];
    //1. 加载音效
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    
    //2. 播放音效
    AudioServicesPlaySystemSound(soundID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [LCAudioTool disposeSound:@"m_03.wav"];
    [LCAudioTool disposeSound:@"buyao.wav"];
}
@end
