//
//  LCWineCell.m
//  0310(1)购物车
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCWineCell.h"
#import "LCWine.h"
#import "LCCircleButton.h"
@interface LCWineCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet LCCircleButton *minusButton;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet LCCircleButton *plusButton;


@end
@implementation LCWineCell

- (IBAction)minusBtnClicked:(id)sender {
        self.wine.count--;
    if (self.wine.count <= 0)
    {
        self.minusButton.enabled = NO;
    }

    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wine.count];
    
    if ([self.delegate respondsToSelector:@selector(wineCellDidClickMinusBtn:)])
    {
        [self.delegate wineCellDidClickMinusBtn:self];
    }
}
- (IBAction)plusBtnClicked:(id)sender {
    self.minusButton.enabled = YES;
    self.wine.count++;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wine.count];
    
    if ([self.delegate respondsToSelector:@selector(wineCellDidClickPlusBtn:)])
    {
        [self.delegate wineCellDidClickPlusBtn:self];
    }
}


- (void)setWine:(LCWine *)wine
{
    
    _wine = wine;
    self.iconView.image = [UIImage imageNamed:wine.image];
    self.nameLabel.text = wine.name;
    self.priceLabel.text = wine.money;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wine.count];
//    NSLog(@"%@",self.nameLabel.text);
    self.minusButton.enabled = (wine.count > 0);
}

@end
