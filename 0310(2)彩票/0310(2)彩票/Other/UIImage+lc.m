//
//  UIImage+lc.m
//  0310(2)彩票
//
//  Created by admin on 16/3/10.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "UIImage+lc.h"

@implementation UIImage (lc)

+ (UIImage *)imageWithOriginal:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (UIImage *)stretchImageName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image   stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
   
    return image;
}
@end
