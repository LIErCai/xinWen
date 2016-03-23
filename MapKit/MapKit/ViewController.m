//
//  ViewController.m
//  MapKit
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LCAnnotation.h"
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //获取用户位置的模式
//    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
//    
//    // 设置地图显示的模式
//    self.mapView.mapType = MKMapTypeStandard;
//    
//    // 设置代理
//    self.mapView.delegate = self;
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    [self.mapView  addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMapView:)]];
    
}

- (void)tapMapView:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:tap.view];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
 
    LCAnnotation *ann = [[LCAnnotation alloc] init];
    ann.title = @"小彩";
    ann.coordinate = coordinate;
    ann.subtitle = @"你很棒";
    
    [self.mapView addAnnotation:ann];
}
- (IBAction)backToUserLocation:(id)sender {
    
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}

/**
 *  当用户位置更新时调用
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
    [mapView setRegion:MKCoordinateRegionMake(center, span) animated:YES];
}

@end
