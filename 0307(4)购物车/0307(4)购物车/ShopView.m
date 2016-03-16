//
//  ShopView.m
//  0307(4)购物车
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ShopView.h"
#import "Shop.h"
@interface ShopView()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;

@end
@implementation ShopView

+ (instancetype)shopViewWithShop:(Shop *)shop
{
    ShopView *shopView = [[ShopView alloc] init];
    shopView.shop = shop;
    return shopView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor greenColor];
        self.iconView = iconView;
        [self addSubview:iconView];
        
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.backgroundColor = [UIColor yellowColor];
        nameLabel.font = [UIFont systemFontOfSize:13];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
       
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.iconView.frame = CGRectMake(0, 0, w, w);
    self.nameLabel.frame = CGRectMake(0,w, w, h - w);
    
}

- (void)setShop:(Shop *)shop
{
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.nameLabel.text = shop.name;
}
@end
