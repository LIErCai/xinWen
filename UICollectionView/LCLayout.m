//
//  LCLayout.m
//  UICollectionView
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCLayout.h"

@implementation LCLayout
/**
 *  返回所有布局后的cell;
 *
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //1. 取得rect这段区域内对应的所有布局
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    CGFloat offsetX = self.collectionView.contentOffset.x;
    CGFloat collectionW = self.collectionView.bounds.size.width;
    
    for (UICollectionViewLayoutAttributes *attr in attrs)
    {
        //2. 计算每个cell离中心点的间距
        CGFloat delta = fabs(attr.center.x - offsetX - collectionW * 0.5);
        CGFloat scale = 1 - delta/collectionW * 0.5;
        NSLog(@"%f", scale);
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return attrs;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 *  确定最终显示位置
 *
 *
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat collectionW = self.collectionView.bounds.size.width;
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0, collectionW, MAXFLOAT);
    NSArray *attrs = [super layoutAttributesForElementsInRect:targetRect];
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs)
    {
        CGFloat delta = attr.center.x - proposedContentOffset.x - collectionW * 0.5;
        if (fabs(delta) < fabs(minDelta))
        {
            minDelta = delta;
        }
    }
    
    proposedContentOffset.x += minDelta;
    
//    if (proposedContentOffset.x < 0)
//    {
//        proposedContentOffset.x = 0;
//    }
    
    return proposedContentOffset;
}
@end
