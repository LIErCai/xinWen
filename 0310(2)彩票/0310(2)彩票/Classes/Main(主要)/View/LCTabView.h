//
//  LCTabView.h
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCTabView : UIView

@property (nonatomic, strong)NSArray *items;
@property (nonatomic, strong) void(^buttonBlock)(UIButton *);

@end
