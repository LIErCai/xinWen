//
//  ViewController.m
//  音乐播放器
//
//  Created by admin on 16/3/26.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "LCMusic.h"
#import  "LCAudioTool.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@property (nonatomic, strong) NSArray *musics;
@property (nonatomic, strong) AVAudioPlayer *currentPlayingAudioPlayer;

@end

@implementation ViewController

- (NSArray *)musics{
    if (_musics == nil)
    {
        _musics = [LCMusic mj_objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    LCMusic *music = self.musics[indexPath.row];
    cell.textLabel.text = music.name;
    cell.detailTextLabel.text = music.singer;
    cell.imageView.image = [self setHeaderImage:music.icon];
    return cell;
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

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCMusic *music  = self.musics[indexPath.row];
    [LCAudioTool stopMusic:music.filename];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCMusic *music = self.musics[indexPath.row];
    AVAudioPlayer *audioPlayer = [LCAudioTool playMusic:music.filename];
    self.currentPlayingAudioPlayer = audioPlayer;
}
@end
