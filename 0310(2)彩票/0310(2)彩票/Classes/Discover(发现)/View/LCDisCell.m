//
//  LCDisCell.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCDisCell.h"

@implementation LCDisCell

+ cellWithTable:(UITableView *)tableView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LCDisCell" owner:nil options:nil] lastObject];
}
@end
