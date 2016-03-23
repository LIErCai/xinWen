//
//  LCAnnotation.h
//  MapKit
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface LCAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;


@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;


@end
