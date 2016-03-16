//
//  LCWineCell.h
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCWine, LCWineCell;

@protocol LCWineCellDelegate <NSObject>
@optional
- (void)wineCellDidClickMinusBtn:(LCWineCell *)wineCell;
- (void)wineCellDidClickPlusBtn:(LCWineCell *)wineCell;
@end
@interface LCWineCell : UITableViewCell

@property (nonatomic, strong) LCWine *wine;

@property (nonatomic, weak) id <LCWineCellDelegate> delegate;

@end
