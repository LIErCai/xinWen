//
//  LCCollectionLayout.m
//  自定义流水布局
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCCollectionLayout.h"

@implementation LCCollectionLayout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSArray *items = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    for (UICollectionViewLayoutAttributes *item in items)
    {
        CGFloat delta = fabs((item.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width * 0.5);
        
        CGFloat scale = 1- (delta / (self.collectionView.bounds.size.width * 0.5) * 0.2);
        item.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return items;
    
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //1. 最终滚动位置
    CGPoint target = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    //2. 获取最终可见区域
    CGRect targetRect = CGRectMake(target.x, 0, self.collectionView.bounds.size.width, MAXFLOAT);
    //3. 获取最终可见区域的cell
    NSArray *items = [super layoutAttributesForElementsInRect:targetRect];
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *item in items)
    {
        CGFloat delta = (item.center.x - target.x - self.collectionView.bounds.size.width * 0.5);
        if (fabs(minDelta) > fabs(delta))
        {
            minDelta = delta;
        }
    }
    target.x += minDelta;
    
    return target;
    
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end
