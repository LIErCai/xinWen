//
//  LCTuanGouDescAnnotationView.m
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCTuanGouDescAnnotationView.h"
#import "LCTuanGouDescAnnotation.h"
#import "LCDescView.h"

@interface LCTuanGouDescAnnotationView()

@property (nonatomic, strong)LCDescView *descView;
@end
@implementation LCTuanGouDescAnnotationView
+ (instancetype)tuangouAnnotationViewWithMapView:(MKMapView *)mapView
{
    NSString *ID = @"tuangou";
    LCTuanGouDescAnnotationView *annotationView = (LCTuanGouDescAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (annotationView == nil)
    {
        annotationView = [[LCTuanGouDescAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
    }
    return annotationView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        LCDescView *descView = [LCDescView descView];
        self.descView = descView;
        [self addSubview:descView];
        self.frame = CGRectMake(0, 0, descView.frame.size.width, descView.frame.size.height + 120);
        
    }
    return self;
}
- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    [super setAnnotation:annotation];
    LCTuanGouDescAnnotation *descAnno = annotation;
    self.descView.tuanGouItem = descAnno.tuanGouItem;
}


- (void)didMoveToSuperview
{
    self.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}
@end
