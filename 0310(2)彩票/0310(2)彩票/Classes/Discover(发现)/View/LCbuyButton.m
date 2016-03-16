//
//  LCbuyButton.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCbuyButton.h"
#import "UIView+LC.h"
@implementation LCbuyButton


- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    NSLog(@"0000");
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)layoutSubviews
{
    
    NSLog(@"111");
    [super layoutSubviews];
        if (self.imageView.x < self.titleLabel.x)
    {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
