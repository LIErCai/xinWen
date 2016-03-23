//
//  LCTuanGouAnnotationView.m
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCTuanGouAnnotationView.h"
#import "LCTuanGouAnnotation.h"
#import "LCTuanGouItem.h"
@implementation LCTuanGouAnnotationView

+ (instancetype)tuangouAnnotationViewWithMapView:(MKMapView *)mapView
{
    NSString *ID = @"tuangou";
    LCTuanGouAnnotationView *annotationView = (LCTuanGouAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (annotationView == nil)
    {
        annotationView = [[LCTuanGouAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
    }
    return annotationView;
}

- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    [super setAnnotation:annotation];
    LCTuanGouAnnotation *anno = annotation;
    
    self.image = [UIImage imageNamed:anno.tuanGouItem.img];
}
@end
