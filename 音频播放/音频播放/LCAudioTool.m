//
//  LCAudioTool.m
//  音频播放
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCAudioTool.h"
#import <AVFoundation/AVFoundation.h>
@implementation LCAudioTool
   static NSMutableDictionary *_soundIDDict;

+ (void)initialize
{
    _soundIDDict  = [NSMutableDictionary dictionary];
}
+ (void)playSound:(NSString *)filename
{
    if (!filename) return;
    SystemSoundID soundID = [_soundIDDict[filename] unsignedIntValue];
    if (!soundID)
    {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
        
        _soundIDDict[filename] = @(soundID);
    }
    AudioServicesPlaySystemSound(soundID);
}

+ (void)disposeSound:(NSString *)filename
{
    if (!filename) return;
    SystemSoundID soundID = [_soundIDDict[filename] unsignedIntValue];
    if (soundID)
    {
        AudioServicesDisposeSystemSoundID(soundID);
        [_soundIDDict removeObjectForKey:filename];
    }
}
@end
