//
//  LCTuanGouDescAnnotation.h
//  自定义大头针
//
//  Created by admin on 16/3/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class LCTuanGouItem;
@interface LCTuanGouDescAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) LCTuanGouItem *tuanGouItem;

@end
