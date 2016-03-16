//
//  ViewController.m
//  UICollectionView
//
//  Created by admin on 16/3/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCLayout.h"
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

  NSString * const ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    LCLayout *layout = ({
        LCLayout *layout = [[LCLayout alloc] init];
        layout.itemSize = CGSizeMake(180, 180);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        CGFloat margin = (self.view.bounds.size.width - 180) * 0.5;
        layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        
            layout.minimumLineSpacing = 20;
        //    layout.minimumInteritemSpacing = 100;
        //    layout.headerReferenceSize = CGSizeMake(50, 50);
        //    layout.sectionHeadersPinToVisibleBounds = YES;
         layout;
        
    });
 
    UICollectionView *collectionView = ({
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200) collectionViewLayout:layout];
        
        collectionView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:collectionView];
        
        collectionView.dataSource = self;
//        collectionView.showsVerticalScrollIndicator = NO;
        collectionView;
    });
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor yellowColor];
    
    
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"120*120"]];
    
    
    return cell;
}
@end
