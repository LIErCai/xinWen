//
//  LCAudioTool.m
//  音频播放
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCAudioTool.h"
//#import <AVFoundation/AVFoundation.h>
@implementation LCAudioTool
   static NSMutableDictionary *_soundIDDict;
   static NSMutableDictionary *_audioPlayerDict;
+ (void)initialize
{
    _soundIDDict  = [NSMutableDictionary dictionary];
    
    _audioPlayerDict = [NSMutableDictionary dictionary];
    
    // 设置音频绘画类型
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [session setActive:YES error:nil];
}
/**
 *  播放音效
 *
 *  @param filename 音效文件名
 */
+ (void)playSound:(NSString *)filename
{
    //1. 从字典中取出soundID
    if (!filename) return;
    SystemSoundID soundID = [_soundIDDict[filename] unsignedIntValue];
    if (!soundID)
    {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return;
        //2. 创建音效
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
        
        _soundIDDict[filename] = @(soundID);
    }
    //3. 播放音效
    AudioServicesPlaySystemSound(soundID);
}

/**
 *  销毁音效
 *
 *  @param filename 音效名称
 */
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

+ (AVAudioPlayer *)playMusic:(NSString *)filename
{
    if (!filename) return nil;
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    if (!audioPlayer)
    {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return nil;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [audioPlayer prepareToPlay];
        
        _audioPlayerDict[filename] = audioPlayer;
    }
    if (!audioPlayer.isPlaying)
    {
        [audioPlayer play];
    }
    return audioPlayer;
}
/**
 *  暂停音乐
 *
 *  @param filename 音乐文件名
 */
+ (void)pauseMusic:(NSString *)filename
{
    if(!filename) return;
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    if (audioPlayer.isPlaying)
    {
        [audioPlayer pause];
    }
}
/**
 *  停止音乐
 *
 *  @param filename 音乐文件名
 */
+ (void)stopMusic:(NSString *)filename
{
    if (!filename) return;
    AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
    if (audioPlayer.isPlaying)
    {
        [audioPlayer stop];
        
        [_audioPlayerDict removeObjectForKey:filename];
    }
}

+ (AVAudioPlayer *)currentPlayingAudioPlayer
{
    for (NSString *filename in _audioPlayerDict)
    {
        AVAudioPlayer *audioPlayer = _audioPlayerDict[filename];
        if(audioPlayer.isPlaying)
        {
            return audioPlayer;
        }
    }
    return nil;
}
@end
