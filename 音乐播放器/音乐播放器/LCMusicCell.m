//
//  LCMusicCell.m
//  音乐播放器
//
//  Created by admin on 16/3/27.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCMusicCell.h"
#import "LCMusic.h"
@implementation LCMusicCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
   static NSString *ID = @"cell";
    LCMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[LCMusicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMusic:(LCMusic *)music
{
    _music = music;
    self.textLabel.text = music.name;
    self.detailTextLabel.text = music.singer;
    self.imageView.image = [self setHeaderImage:music.icon];
    
}

- (UIImage *)setHeaderImage:(NSString  *)name
{
    UIImage *image = [UIImage imageNamed:name];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [path addClip];
    [image drawAtPoint:CGPointZero];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
