//
//  UIImage+Image.m
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)
/*
+ (void)load
{
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method lc_imageNamedMethod = class_getClassMethod(self, @selector(lc_imageNamed:));
    method_exchangeImplementations(imageNamedMethod, lc_imageNamedMethod);
}
+ (UIImage *)lc_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage lc_imageNamed:name];
    if (image)
    {
        NSLog(@"加载成功");
    }else{
        NSLog(@"加载失败");
    }
    return image;
}*/

+ (void)load
{
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method lc_imageNamedMethod = class_getClassMethod(self, @selector(lc_imageNamed:));
    method_exchangeImplementations(imageNamedMethod, lc_imageNamedMethod);
}
+ (UIImage *)lc_imageNamed:(NSString *)name
{
    UIImage *image = [UIImage lc_imageNamed:name];
    if(image)
    {
        NSLog(@"加载成功");
    }else
    {
        NSLog(@"加载失败");
    }
    return image;
}
@end
