//
//  LCDescView.m
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCDescView.h"
#import "LCTuanGouItem.h"
@interface LCDescView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleView;

@end
@implementation LCDescView

+ (instancetype)descView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LCDescView" owner:nil options:nil].lastObject;
}

- (void)setTuanGouItem:(LCTuanGouItem *)tuanGouItem
{
    _tuanGouItem = tuanGouItem;
    self.iconView.image = [UIImage imageNamed:tuanGouItem.icon];
    self.titleLabel.text = tuanGouItem.title;
    self.subTitleView.text = tuanGouItem.subtitle;
}
@end
