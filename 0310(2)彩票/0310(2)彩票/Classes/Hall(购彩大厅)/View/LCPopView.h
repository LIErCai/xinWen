//
//  LCPopView.h
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCPopView : UIView

+ (instancetype)showInCenter:(CGPoint)center;
- (void)hiddeInCenter:(CGPoint)center;
@property (nonatomic, strong) void(^completion)();

@end
