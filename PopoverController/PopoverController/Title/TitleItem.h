//
//  TitleItem.h
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleItem : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
@end
