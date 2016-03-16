//
//  LCPageView.m
//  0307(4)scrollView
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCPageView.h"
@interface LCPageView()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end
@implementation LCPageView
+ (instancetype)pageView
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.pagingEnabled = YES;
        scrollView.frame = CGRectMake(10, 0, 300, 130);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView  = scrollView;
        
        
        UIPageControl  *pageControl = [[UIPageControl alloc] init];
        pageControl.frame = CGRectMake(self.scrollView.frame.size.width * 0.05, self.scrollView.frame.size.height * 0.7, 100, 40);
        [pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
        [pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        
        [self startTimer];
    }
    return self;
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}
- (void)stopTimer
{
    [self.timer invalidate];
}
- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    CGFloat imageViewX = 0;
    CGFloat imageViewY = 0;
    CGFloat imageViewW = self.scrollView.frame.size.width;
    CGFloat imageViewH = self.scrollView.frame.size.height;
    for (int i = 0; i < imageNames.count; i++)
    {
        imageViewX = i * imageViewW;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        imageView.image = [UIImage imageNamed:imageNames[i]];
      
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(imageViewW * imageNames.count, 0);
    self.pageControl.numberOfPages = imageNames.count;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.pageControl.currentPage = offsetX / scrollView.frame.size.width + 0.5;
}

- (void)nextPage
{
    NSInteger page = self.pageControl.currentPage + 1;
    if (page == self.imageNames.count)
    {
        page = 0;
    }
    
     CGPoint offset =  CGPointMake(page * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
@end
