//
//  LCMusic.h
//  音乐播放器
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMusic : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *singer;
@property (nonatomic, strong) NSString *singerIcon;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *filename;

@property (nonatomic, assign, getter=isPlaying) BOOL playing;
@end
