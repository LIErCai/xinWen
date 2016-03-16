//
//  LCPopView.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCPopView.h"

@interface LCPopView()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *closeBtn;

@end
@implementation LCPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"xiaopingguo"];
        self.imageView = imageView;
        [self addSubview:imageView];
        
        UIButton *closeBtn = [[UIButton alloc] init];
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(hiddeInCenter:) forControlEvents:UIControlEventTouchUpInside];
        self.closeBtn = closeBtn;
        [self addSubview:closeBtn];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    
    CGFloat closeW = 20;
    CGFloat closeH = 20;
    CGFloat closeX = self.bounds.size.width - closeW;
    CGFloat closeY = 0;
    self.closeBtn.frame = CGRectMake(closeX, closeY, closeW, closeH);
}
- (void)hiddeInCenter:(CGPoint)center
{
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.center = center;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (_completion)
        {
            _completion();
        }
    }];
}
+ (instancetype)showInCenter:(CGPoint)center
{
    LCPopView *popView = [[LCPopView alloc] init];
    popView.bounds = CGRectMake(0, 0, 200, 200);
    popView.center = center;
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
    return popView;
}
@end
