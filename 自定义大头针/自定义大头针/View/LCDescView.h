//
//  LCDescView.h
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCTuanGouItem;
@interface LCDescView : UIView

+ (instancetype)descView;
@property (nonatomic, strong) LCTuanGouItem *tuanGouItem;

@end
