//
//  LCNewFeatureController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCNewFeatureController.h"
#import "LCNewFeatureCell.h"
#import "UIView+LC.h"
#define  UIScreenW = [UIScreen mainScreen].bounds.size.width
#define  UIScreenH = [UIScreen mainScreen].bounds.size.height

@interface LCNewFeatureController()

@property (nonatomic, weak) UIImageView *guideImageView;
@property (nonatomic, weak) UIImageView *guideLargeTextImageView;
@property (nonatomic, weak) UIImageView *guideSmallTextImageView;
@property (nonatomic, assign) CGFloat lastOffsetX;

@end
@implementation LCNewFeatureController


- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    layout.itemSize = [UIScreen mainScreen].bounds.size;
//    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}
    NSString *const ID = @"cell";

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    
    [self.collectionView registerClass:[LCNewFeatureCell class] forCellWithReuseIdentifier:ID];
    
    [self setupImageView];
}

- (void)setupImageView
{
    UIImageView *guideImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    guideImage.x += 50;
    [guideImage sizeToFit];
    [self.collectionView addSubview:guideImage];
    self.guideImageView = guideImage;
   
    UIImageView *guideLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLineImageView.x -= 150;
        [guideLineImageView sizeToFit];
    [self.collectionView addSubview:guideLineImageView];
    
    UIImageView *guieLargeTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    guieLargeTextImageView.center = CGPointMake(self.collectionView.width * 0.5, self.collectionView.height * 0.7);
            [guieLargeTextImageView sizeToFit];
    [self.collectionView addSubview:guieLargeTextImageView ];
    self.guideLargeTextImageView = guieLargeTextImageView;
    
    UIImageView *guieSmallTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
        guieSmallTextImageView.center = CGPointMake(self.collectionView.width * 0.5, self.collectionView.height * 0.8);
                [guieSmallTextImageView sizeToFit];
    [self.collectionView addSubview:guieSmallTextImageView];
    self.guideSmallTextImageView = guieSmallTextImageView;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger page = offsetX / scrollView.width + 1;
    NSString *name = [NSString stringWithFormat:@"guide%ld",page];
    self.guideImageView.image = [UIImage imageNamed:name];
    
    NSString *largeTextname = [NSString stringWithFormat:@"guideLargeText%ld",page];
    self.guideLargeTextImageView.image = [UIImage imageNamed:largeTextname];
    
    NSString *smallTextname = [NSString stringWithFormat:@"guideSmallText%ld",page];
    self.guideLargeTextImageView.image = [UIImage imageNamed:smallTextname];
    
    CGFloat del = offsetX - self.lastOffsetX;
    self.guideImageView.x += del * 2;
    self.guideLargeTextImageView.x += del * 2;
    self.guideSmallTextImageView.x += del * 2;
    [UIView animateWithDuration:0.25f animations:^{
        self.guideImageView.x -= del;
        self.guideLargeTextImageView.x -= del;
        self.guideSmallTextImageView.x -= del;
    }];

    self.lastOffsetX = offsetX;

}
#define  cellNumber 4
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cellNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground568h", indexPath.row +1];
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:cellNumber];
//    cell.backgroundColor = [UIColor blueColor];
    return cell;
}
@end
