//
//  LCAudioTool.h
//  音频播放
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface LCAudioTool : NSObject

+ (void)playSound:(NSString *)filename;

+ (void)disposeSound:(NSString *)filename;

+ (AVAudioPlayer *)playMusic:(NSString *)filename;

+ (void)pauseMusic:(NSString *)filename;

+ (void)stopMusic:(NSString *)filename;

+ (AVAudioPlayer *)currentPlayingAudioPlayer;
@end
