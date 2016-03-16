//
//  LCSettingItem.h
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LCSettingItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) void(^operation)(NSIndexPath *indexPath);

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle;
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
@end
