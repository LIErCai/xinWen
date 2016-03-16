//
//  LCTabView.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCTabView.h"
#import "LCButton.h"
@interface LCTabView()

@property (nonatomic, weak) UIButton *selButton;

@end
@implementation LCTabView

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (int i = 0; i < self.items.count; i++)
    {
        UITabBarItem *item = items[i];
        LCButton *button = [[LCButton alloc] init];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setImage:item.selectedImage forState:UIControlStateSelected];
        [button  addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:button];
        
        if (i == 0)
        {
            [self buttonClicked:button];
        }
    }
}

- (void)buttonClicked:(LCButton *)button
{
    self.selButton.selected = NO;
    button.selected = YES;
    self.selButton = button;
    if (_buttonBlock)
    {
        _buttonBlock(button);
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    CGFloat btnX;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / count;
    CGFloat btnH = self.frame.size.height;
    for (int i = 0; i < count; i++)
    {
        btnX = btnW * i;
        LCButton *btn = self.subviews[i];
        btn.tag = i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
@end
