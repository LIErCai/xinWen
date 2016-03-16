//
//  ModalViewController.h
//  block
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController

@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) void(^block)(NSString *name);
@property (nonatomic, strong) void(^block)();
@end
