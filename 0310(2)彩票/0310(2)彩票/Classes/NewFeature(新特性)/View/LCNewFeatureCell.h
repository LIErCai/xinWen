//
//  LCNewFeatureCell.h
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;

@end
