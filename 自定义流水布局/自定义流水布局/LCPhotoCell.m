//
//  LCPhotoCell.m
//  自定义流水布局
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


#import "LCPhotoCell.h"
#import "Masonry.h"
@interface LCPhotoCell()

@property (nonatomic, weak) UIImageView *imageView;

@end
@implementation LCPhotoCell

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.backgroundColor = [UIColor redColor];
//        imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView = imageView;
        [self addSubview:imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.imageView.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20);
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(10);
        make.right.equalTo(self.right).offset(-10);
        make.bottom.equalTo(self.bottom).offset(-10);
        
    }];
}
@end