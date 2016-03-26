//
//  LCAudioTool.h
//  音频播放
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAudioTool : NSObject

+ (void)playSound:(NSString *)filename;

+ (void)disposeSound:(NSString *)filename;

@end
