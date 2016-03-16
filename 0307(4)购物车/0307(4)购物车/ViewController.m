//
//  ViewController.m
//  0307(4)购物车
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "ShopView.h"
#import "Shop.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) NSArray *shops;
@property (nonatomic, weak) UIView  *shopCarView;

@property (nonatomic, weak) UIButton *addBtn;
@property (nonatomic, weak) UIButton *removeBtn;


@end

@implementation ViewController

- (NSArray *)shops
{
    if (_shops == nil)
    {
        NSString *file = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
        NSArray *shopArr = [NSArray arrayWithContentsOfFile:file];
        NSMutableArray *shops = [NSMutableArray array];
        for (NSDictionary *dict in shopArr)
        {
            Shop *shop = [Shop shopWithDict:dict];
            [shops   addObject:shop];
        }
        _shops = shops;
    }
    return _shops;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *addBtn = [[UIButton alloc] init];
    addBtn.frame = CGRectMake(30, 30, 50, 50);
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"add_highlighted"] forState:UIControlStateHighlighted];
    [addBtn setImage:[UIImage imageNamed:@"add_disabled"] forState:UIControlStateDisabled];
    
    [addBtn addTarget:self action:@selector(addShop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    self.addBtn = addBtn;
    
    
    UIButton *removeBtn = [[UIButton alloc] init];
    removeBtn.frame = CGRectMake(280, 30, 50, 50);
    [removeBtn setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [removeBtn setImage:[UIImage imageNamed:@"remove_highlighted"] forState:UIControlStateHighlighted];
    [removeBtn setImage:[UIImage imageNamed:@"remove_disabled"] forState:UIControlStateDisabled];
    removeBtn.enabled = NO;
    [removeBtn addTarget:self action:@selector(removeShop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
    self.removeBtn = removeBtn;
    
    UIView *shopCarView = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 300, 300)];
    shopCarView.backgroundColor = [UIColor whiteColor];
    self.shopCarView = shopCarView;
    [self.view addSubview:shopCarView];
    
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.frame = CGRectMake(0, 0, 200, 50);
    showLabel.center = self.view.center;
    showLabel.backgroundColor = [UIColor purpleColor];
    showLabel.textAlignment = NSTextAlignmentCenter;
     showLabel.text = @"购物车已满";
    showLabel.textColor = [UIColor blackColor];
    showLabel.alpha = 0.0;
    self.showLabel = showLabel;
    showLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.5];
    [self.view addSubview:showLabel];
}

- (void)addShop:(UIButton *)btn
{
    self.removeBtn.enabled = YES;
    int totalCol = 3;
    
    CGFloat shopViewW = 60;
    CGFloat shopViewH = 80;
    CGFloat marginW = (self.shopCarView.frame.size.width - totalCol * shopViewW) / (totalCol + 1);
    CGFloat marginH = 20;
    
    NSInteger index = self.shopCarView.subviews.count;
   
    NSInteger col = index % totalCol;
    NSInteger row = index / totalCol;
    CGFloat shopViewX = marginW + col * (marginW + shopViewW);
    CGFloat shopViewY = marginH + row * (marginH + shopViewH);
    
    ShopView *shopView = [ShopView shopViewWithShop:self.shops[index]];
    shopView.frame = CGRectMake(shopViewX, shopViewY, shopViewW, shopViewH);
    [self.shopCarView addSubview:shopView];
    
    btn.enabled = (self.shopCarView.subviews.count < self.shops.count);
    if (self.addBtn.enabled == NO)
    {
        self.showLabel.text = @"购物车已满";
        [UIView animateWithDuration:1.0 animations:^{
            
            
            self.showLabel.alpha = 1.0;
            NSLog(@"%@",  self.showLabel.text);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 delay:1.0 options:kNilOptions animations:^{
                self.showLabel.alpha = 0.0;
            } completion:nil];
        }];
//        [self showHud:@"购物车已满"];
    }
    
}

- (void)removeShop
{
    self.addBtn.enabled = YES;
    [self.shopCarView.subviews.lastObject removeFromSuperview];
    
    self.removeBtn.enabled = (self.shopCarView.subviews.count > 0);
    
    if (self.removeBtn.enabled == NO)
    {
        [UIView animateWithDuration:1.0 animations:^{
            self.showLabel.alpha = 1.0;
            self.showLabel.text = @"购物车已空";
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 delay:1.0 options:kNilOptions animations:^{
                self.showLabel.alpha = 0.0;
            } completion:nil];
        }];
//        [self showHud:@"购物车已空"];
    }
}

- (void)showHud:(NSString *)text
{
    self.showLabel.text = text;
    
    // 慢慢出现（出现动画持续1秒）
    [UIView animateWithDuration:1.0 animations:^{
        self.showLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        // 1.5秒后，再慢慢消失（消失动画持续1秒）
        [UIView animateWithDuration:1.0 delay:1.5 options:kNilOptions animations:^{
            self.showLabel.alpha = 0.0;
        } completion:nil];
        
    }];
}

@end
