//
//  ViewController.m
//  网易新闻
//
//  Created by admin on 16/3/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCHotViewController.h"
#import "LCScienceViewController.h"
#import "LCReaderViewController.h"
#import "LCTopViewController.h"
#import "LCVideoViewController.h"
#import "LCScoietyViewController.h"

#define screenW  self.view.frame.size.width
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *titleScrollView;
@property (nonatomic, weak) UIScrollView *contentScrollView;
@property (nonatomic, weak) UIButton *seleButton;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation ViewController

- (NSMutableArray *)buttons
{
    if (_buttons == nil)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"网易新闻";
    
    //1. 创建标题view
    [self setupTitleScrollView];
    
    //2. 创建自控制器的滚动视图
    [self setupContentScrollView];
    
    //3. 添加子控制器
    [self setupChildControl];
    
    //4. 添加所有标题
    [self setupAllTitle];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger leftI = scrollView.contentOffset.x / screenW;
    CGFloat leftF = scrollView.contentOffset.x / screenW;
    
    NSInteger rightI = leftI + 1;
    CGFloat scaleR = leftF - leftI;
    CGFloat scaleL = 1 - scaleR;
    
    UIButton *leftBtn = self.buttons[leftI];
    UIButton *rightBtn;
    
    if (rightI < self.buttons.count)
    {
        rightBtn = self.buttons[rightI];
    }
    
    leftBtn.transform = CGAffineTransformMakeScale(scaleL * 0.2 + 1, scaleL * 0.2 + 1);
     rightBtn.transform = CGAffineTransformMakeScale(scaleR * 0.2 + 1, scaleR * 0.2 + 1);
    
    UIColor *leftColor = [UIColor colorWithRed:scaleL green:0 blue:0 alpha:1];
    UIColor *rightColor = [UIColor colorWithRed:scaleR green:0 blue:0 alpha:1];
    [leftBtn setTitleColor:leftColor forState:UIControlStateNormal];
    [rightBtn setTitleColor:rightColor forState:UIControlStateNormal];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //1. 计算位移
    NSInteger i = scrollView.contentOffset.x / screenW + 0.5;
    //2. 改变对应标题
    UIButton *button = self.buttons[i];
    [self buttonClicked:button];
    
}
/**
 *  添加所有标题
 */
- (void)setupAllTitle
{
    CGFloat buttonX ;
    CGFloat buttonY = 0;
    CGFloat buttonW = 100;
    CGFloat buttonH = self.titleScrollView.frame.size.height;
    NSInteger count = self.childViewControllers.count;
    for (int i = 0; i < count; i++)
    {
        UIViewController *vc = self.childViewControllers[i];
        buttonX = i * buttonW;
        UIButton *button = [[UIButton  alloc] init];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        [self.buttons addObject:button];
        button.tag = i;
        [self.titleScrollView addSubview:button];
        
        if (i == 0)
        {
            [self buttonClicked:button];
        }
        
    }
    self.titleScrollView.contentSize = CGSizeMake(count * buttonW, 0);
    self.contentScrollView.contentSize = CGSizeMake(count * screenW, 0);
}
/**
 *  按钮点击
 *
 */
- (void)buttonClicked:(UIButton *)button
{
    NSInteger i = button.tag;
    //1. 改变选中的标题
    [self changeButton:button];
    
    //2. 加载对应自控制器的view;
    [self addChildView:i];
    
    //3. 将contentScrollView滚动到对应位置;
    [self.contentScrollView setContentOffset:CGPointMake(i * screenW, 0) animated:YES];
}
/**
 *  加载对应自控制器的view;
 */
- (void)addChildView:(NSInteger)i
{
    UIViewController *vc = self.childViewControllers[i];
    if (vc.view.superview) return;
    CGFloat vcX = i * screenW;
    CGFloat vcY = 0;
    CGFloat vcW = self.contentScrollView.frame.size.width;
    CGFloat vcH = self.contentScrollView.frame.size.height;
    vc.view.frame = CGRectMake(vcX, vcY, vcW, vcH);
    [self.contentScrollView addSubview:vc.view];
}
/**
 *  改变选中的标题
 *
 */
- (void)changeButton:(UIButton *)button
{
    self.seleButton.transform = CGAffineTransformIdentity;
    [self.seleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button  setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    self.seleButton = button;
    
    
    // 改变位置
    CGFloat offset = button.center.x - screenW * 0.5;
    if (offset < 0)
    {
        offset = 0;
    }
    CGFloat maxOffset = self.titleScrollView.contentSize.width - screenW;
    if (offset > maxOffset)
    {
        offset = maxOffset;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}
/**
 *  添加子控制器
 */
- (void)setupChildControl
{
    LCScoietyViewController *scoietyVC = [[LCScoietyViewController alloc] init];
    scoietyVC.title = @"社会";
    [self addChildViewController:scoietyVC];
    
    LCScienceViewController *scienceVC = [[LCScienceViewController alloc] init];
    scienceVC.title = @"科学";
    [self addChildViewController:scienceVC];
    
    LCTopViewController *topVC = [[LCTopViewController alloc] init];
    topVC.title = @"头条";
    [self addChildViewController:topVC];
    
    LCVideoViewController *videoVC = [[LCVideoViewController alloc] init];
    videoVC.title = @"视频";
    [self addChildViewController:videoVC];
    
    LCReaderViewController *readVC = [[LCReaderViewController alloc] init];
    readVC.title = @"阅读";
    [self addChildViewController:readVC];
    
    LCHotViewController *hotVC = [[LCHotViewController alloc] init];
    hotVC.title = @"热点";
    [self addChildViewController:hotVC];
}
/**
 *  创建标题scrollview
 */
- (void)setupTitleScrollView
{
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    CGFloat tSX = 0;
    CGFloat tSY = self.navigationController.navigationBarHidden ? 20 : 64;
    CGFloat tSW = screenW;
    CGFloat tSH = 44;
    titleScrollView.frame = CGRectMake(tSX, tSY, tSW, tSH);
    self.titleScrollView = titleScrollView;
    titleScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:titleScrollView];
}
/**
 *  加载子控制器的scrollview
 */
- (void)setupContentScrollView
{
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    CGFloat cSX = 0;
    CGFloat cSY =CGRectGetMaxY(self.titleScrollView.frame);
    CGFloat cSW = screenW;
    CGFloat cSH = self.view.frame.size.height - cSY;
    contentScrollView.frame = CGRectMake(cSX, cSY, cSW, cSH);
   
    contentScrollView.pagingEnabled = YES;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.delegate = self;
    self.contentScrollView = contentScrollView;
   [self.view addSubview:contentScrollView];
}
@end
