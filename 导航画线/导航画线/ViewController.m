//
//  ViewController.m
//  导航画线
//
//  Created by admin on 16/3/23.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LCAnnotation.h"
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong)CLGeocoder *geocoder;

@end

@implementation ViewController

- (CLGeocoder *)geocoder
{
    if (_geocoder == nil)
    {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    NSString *address1 = @"太原";
    NSString *address2 = @"广州";
    
    [self.geocoder geocodeAddressString:address1 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) return;
        CLPlacemark *fromPm = [placemarks firstObject];
        [self.geocoder geocodeAddressString:address2 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if(error) return;
            CLPlacemark *toPm = [placemarks firstObject];
            
            [self addLineFrom:fromPm to:toPm];
        }];
        
    }];
}

- (void)addLineFrom:(CLPlacemark *)fromPm to:(CLPlacemark *)toPm
{
    LCAnnotation *fromAnno = [[LCAnnotation alloc] init];
    fromAnno.coordinate = fromPm.location.coordinate;
    fromAnno.title = fromPm.name;
    [self.mapView addAnnotation:fromAnno];
    
    LCAnnotation *toAnno = [[LCAnnotation alloc] init];
    toAnno.coordinate = toPm.location.coordinate;
    toAnno.title = toPm.name;
    [self.mapView addAnnotation:toAnno];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    MKPlacemark *sourcePm = [[MKPlacemark alloc] initWithPlacemark:fromPm];
    request.source = [[MKMapItem alloc] initWithPlacemark:sourcePm];
    
    MKPlacemark *destinationPm = [[MKPlacemark alloc] initWithPlacemark:toPm];
    request.destination = [[MKMapItem alloc] initWithPlacemark:destinationPm];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        if (error) return;
        for (MKRoute *route in response.routes)
        {
            [self.mapView addOverlay:route.polyline];
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
//    MKOverlayRenderer *renderer = [[MKOverlayRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor redColor];
    return renderer;
}
@end
