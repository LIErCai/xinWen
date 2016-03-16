//
//  ViewController.m
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "LCWine.h"
#import "LCWineCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, LCWineCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *wines;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (nonatomic, assign) int totalPrice;

@property (nonatomic, strong) NSMutableArray *wineCar;

@end

@implementation ViewController

 NSString * const ID = @"wine";
- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self.tableView registerClass:[LCWineCell class] forCellReuseIdentifier:ID];
}

- (NSMutableArray *)wineCar
{
    if (_wineCar == nil)
    {
        _wineCar = [NSMutableArray array];
    }
    return _wineCar;
}
- (NSArray *)wines{
    if (_wines == nil)
    {
        NSArray *wineArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil]];
        NSMutableArray *wines = [NSMutableArray array];
        for (NSDictionary *dict in wineArr)
        {
            LCWine *wine = [LCWine wineWithDict:dict];
            [wines addObject:wine];
            
        }
        _wines = wines;
    }
    return _wines;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LCWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.delegate = self;
  
    LCWine *wine = self.wines[indexPath.row];
    cell.wine = wine;
    return cell;
}
- (void)wineCellDidClickPlusBtn:(LCWineCell *)wineCell
{
    self.buyButton.enabled = YES;
    LCWine *wine = wineCell.wine;
    
    self.totalPrice = self.totalPrice +  [wine.money intValue];
    self.totalLabel.text = [NSString stringWithFormat:@"%d", self.totalPrice];
    
    if ([self.wineCar containsObject:wineCell.wine]) return;
    [self.wineCar addObject:wineCell.wine];
}

- (void)wineCellDidClickMinusBtn:(LCWineCell *)wineCell
{
    LCWine *wine = wineCell.wine;
    self.totalPrice = self.totalPrice - [wine.money intValue];
    self.totalLabel.text = [NSString stringWithFormat:@"%d", self.totalPrice];
    self.buyButton.enabled = (self.totalPrice > 0);
    if (wine.count == 0)
    {
        [self.wineCar removeObject:wineCell.wine];
    }
    
   
   
}
- (IBAction)clearCar:(id)sender {
//    self.totalPrice = 0;
    
//    for (LCWine *wine in self.wines)
//    {
//        wine.count = 0;
//    }
    
    for (LCWine *wine in self.wineCar)
    {
        wine.count = 0;
    }
    self.totalLabel.text = @"0";
    self.totalPrice = 0;
    [self.wineCar removeAllObjects];
    self.buyButton.enabled = NO;
    
    [self.tableView reloadData];
}
@end
