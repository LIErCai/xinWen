//
//  ColorPickerViewController.h
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPickerViewController : UIViewController

@property (nonatomic, strong) void(^color)(UIColor *);

@end
