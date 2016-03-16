//
//  LCNewFeatureCell.m
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCNewFeatureCell.h"
#import "UIView+LC.h"
#import "LCTabBarController.h"
@interface LCNewFeatureCell()

@property (nonatomic, weak) UIImageView *bgImageView;

@property (nonatomic, weak) UIButton *startBtn;


@end
@implementation LCNewFeatureCell

- (UIButton *)startBtn
{
    if (_startBtn == nil)
    {
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
            [btn sizeToFit];
        btn.center = CGPointMake(self.contentView.width * 0.5, self.contentView.height * 0.9);
    
        [btn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        _startBtn = btn;
    }
    return _startBtn;
}

- (void)startBtnClick
{
    [UIApplication sharedApplication].keyWindow.rootViewController = [[LCTabBarController alloc] init];
}
- (UIImageView *)bgImageView
{
    if (_bgImageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        _bgImageView = imageView;
    }
    return _bgImageView;
}
- (void)setImage:(UIImage *)image
{
    _image  = image;
    self.bgImageView.image = image;
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count
{
    if (indexPath.item +1 == count)
    {
        self.startBtn.hidden = NO;
    }else
    {
        self.startBtn.hidden = YES;
    }
}
@end
