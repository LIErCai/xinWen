//
//  ShopView.h
//  0307(4)购物车
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shop;
@interface ShopView : UIView

@property (nonatomic, strong) Shop *shop;

+ (instancetype)shopViewWithShop:(Shop *)shop;
@end
