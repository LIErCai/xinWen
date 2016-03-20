//
//  LCViewController.m
//  CoreLocation
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface LCViewController ()
@property (nonatomic, strong)CLGeocoder *geocoder;

@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailAddressLabel;

@property (weak, nonatomic) IBOutlet UITextField *longtitudeField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UILabel *reverseDetatilAddressLabel;

@end

@implementation LCViewController

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
    
}
- (IBAction)address:(id)sender {
    
    NSString *addressStr = self.addressField.text;
    if (addressStr.length == 0) return;
    [self.geocoder geocodeAddressString:addressStr completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error)
        {
            self.detailAddressLabel.text = @"您搜索的地址不存在";
        }else
        {
            CLPlacemark *pm = [placemarks firstObject];
            
            self.latitudeLabel.text = [NSString stringWithFormat:@"%.1f", pm.location.coordinate.latitude];
            self.longitudeLabel.text = [NSString stringWithFormat:@"%.1f", pm.location.coordinate.longitude];
            
            self.detailAddressLabel.text = pm.name;
        }
    }];
}


- (IBAction)reverseAddress:(id)sender {
    
    CLLocationDegrees latitude = [self.latitudeField.text  doubleValue];
    CLLocationDegrees longitude = [self.longtitudeField.text doubleValue];
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [self.geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
      
        
        if (error)
        {
            self.reverseDetatilAddressLabel.text = @"结束的承诺";
        }else
        {
              CLPlacemark *pm = [placemarks firstObject];
            self.reverseDetatilAddressLabel.text = pm.name;

        }
        
    }];
}

@end
