//
//  LCTuanGouAnnotation.m
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCTuanGouAnnotation.h"
#import "LCTuanGouItem.h"
@implementation LCTuanGouAnnotation

- (void)setTuanGouItem:(LCTuanGouItem *)tuanGouItem
{
    _tuanGouItem = tuanGouItem;
    
    self.coordinate = tuanGouItem.coordinate;
}
@end
