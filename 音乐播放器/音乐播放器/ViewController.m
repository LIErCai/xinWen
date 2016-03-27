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
#import "LCMusicCell.h"
@interface ViewController ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) NSArray *musics;
@property (nonatomic, strong) AVAudioPlayer *currentPlayingAudioPlayer;
@property (nonatomic, strong) CADisplayLink *link;


@end

@implementation ViewController
- (IBAction)jump:(id)sender {
    
    self.currentPlayingAudioPlayer.currentTime = self.currentPlayingAudioPlayer.duration - 5;
}

- (CADisplayLink *)link
{
    if (_link == nil)
    {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(change)];
    }
    return _link;
}

- (void)change
{
    CGFloat angle = self.link.duration *M_PI_4;
    LCMusicCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    cell.imageView.transform = CGAffineTransformRotate(cell.imageView.transform, angle);
}
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
    LCMusicCell *cell = [LCMusicCell cellWithTableView:tableView];
    LCMusic *music = self.musics[indexPath.row];
    cell.music = music;
    return cell;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCMusic *music  = self.musics[indexPath.row];
    [LCAudioTool stopMusic:music.filename];
    music.playing = NO;
    LCMusicCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.transform = CGAffineTransformIdentity;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCMusic *music = self.musics[indexPath.row];
    
    AVAudioPlayer *audioPlayer = [LCAudioTool playMusic:music.filename];
    audioPlayer.delegate = self;
    self.currentPlayingAudioPlayer = audioPlayer;
    
    
    [self.link invalidate];
    self.link = nil;
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    music.playing = YES;
//    CGFloat angle = self.link.duration *M_PI_4;
//    LCMusicCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    cell.imageView.transform = CGAffineTransformRotate(cell.imageView.transform, angle);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
    NSInteger nextRow = selectedPath.row + 1;
    if (nextRow == self.musics.count)
    {
        nextRow = 0;
    }
    
    LCMusic *music = self.musics[selectedPath.row];
    music.playing = NO;
    LCMusicCell *cell = [self.tableView cellForRowAtIndexPath:selectedPath];
    cell.imageView.transform = CGAffineTransformIdentity;
    NSIndexPath *currentPath = [NSIndexPath indexPathForRow:nextRow inSection:selectedPath.section];
    
    [self.tableView selectRowAtIndexPath:currentPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    [self tableView:self.tableView didSelectRowAtIndexPath:currentPath];
}

@end
