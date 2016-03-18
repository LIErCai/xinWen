//
//  ColorPickerViewController.m
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ColorPickerViewController.h"
#import "UIImage+MJ.h"
@interface ColorPickerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = self.imageView.frame.size;
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    UIColor *color = [self.imageView.image pixelColorAtLocation:point];
    if (_color)
    {
        _color(color);
    }

}

@end
