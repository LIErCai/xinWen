//
//  LCMusicCell.h
//  音乐播放器
//
//  Created by admin on 16/3/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCMusic;
@interface LCMusicCell : UITableViewCell

@property (nonatomic, strong) LCMusic *music;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
