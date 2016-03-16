//
//  LCCircleButton.m
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCCircleButton.h"

@implementation LCCircleButton

- (void)awakeFromNib
{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}
@end
