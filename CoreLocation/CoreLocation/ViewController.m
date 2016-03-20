//
//  ViewController.m
//  CoreLocation
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locMgr;

@end

@implementation ViewController

- (CLLocationManager *)locMgr
{
    if (_locMgr == nil)
    {
        _locMgr = [[CLLocationManager alloc] init];
        _locMgr.delegate = self;
    }
    return _locMgr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.locMgr startUpdatingLocation];
    
//    CLRegion *region = [[CLRegion alloc] init];
//    [self.locMgr startMonitoringForRegion:region];
    
    [self countLineDistance];
}


- (void)countLineDistance
{
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:40 longitude:116];
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:41 longitude:116];
    
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
    
    NSLog(@"%f", distance);
}
// 定位到用户的位置,就会调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //1. 取出位置对象
    CLLocation *loc = [locations firstObject];
    
    //2. 取出经纬度
    CLLocationCoordinate2D coordinate = loc.coordinate;
    
    //3.
    NSLog(@"%f----%f", coordinate.latitude, coordinate.longitude);
    
    [manager stopUpdatingLocation];
}
@end
