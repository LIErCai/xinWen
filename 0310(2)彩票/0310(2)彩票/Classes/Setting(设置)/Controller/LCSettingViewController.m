//
//  LCSettingViewController.m
//  0310(2)彩票
//
//  Created by admin on 16/3/11.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCSettingViewController.h"
#import "MBProgressHUD.h"
#import "LCPushViewController.h"
#import "LCBlueViewController.h"
@interface LCSettingViewController()


@end
@implementation LCSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    [self setupData];
}

- (void)setupData
{
    [self group1];
   
    [self group2];
    
    [self group3];
}

- (void)group1
{
    LCSettingAccessoryItem *acceItem = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    //    acceItem.desVc = [LCPushViewController class];
    __weak typeof(self) weakSelf = self;
    acceItem.operation = ^(NSIndexPath *indexPath){
        LCPushViewController *vc = [[LCPushViewController alloc] init];
        vc.title = @"红色";
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    LCSettingItemGroup *group1 = [LCSettingItemGroup itemGroupWithitems:@[acceItem]];
    group1.header = @"123";
    group1.footer = @"qeqrere";
      [self.itemGroups addObject:group1];
}

- (void)group2
{
    
    LCSettingAccessoryItem *acceoItem = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    LCSettingSwithItem *swItem = [LCSettingSwithItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇机选"];
    LCSettingSwithItem *swItem2 = [LCSettingSwithItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    LCSettingSwithItem *swItem3 = [LCSettingSwithItem itemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    LCSettingItemGroup *group2 = [LCSettingItemGroup itemGroupWithitems:@[acceoItem, swItem, swItem2, swItem3]];
    group2.header = @"音乐";
    
    [self.itemGroups addObject:group2];
}

- (void)group3
{
    LCSettingAccessoryItem *item1 = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"检查新版本"];
    item1.operation = ^(NSIndexPath *indexPath){
     
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view  animated:YES];

        });

       
    };
    LCSettingAccessoryItem *item2 = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MoreHelp"] title:@"帮助"];
       __weak typeof(self) weakSelf = self;
    item2.operation = ^(NSIndexPath *indexPath){
        LCBlueViewController *vc = [[LCBlueViewController alloc] init];
        vc.title = @"帮助";
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    LCSettingAccessoryItem *item3 = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MoreWo"] title:@"分享"];
    LCSettingAccessoryItem *item4 = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"查看消息"];
    LCSettingAccessoryItem *item5 = [LCSettingAccessoryItem itemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    LCSettingItemGroup *group3 = [LCSettingItemGroup itemGroupWithitems:@[item1, item2, item3, item4, item5]];
    [self.itemGroups addObject:group3];
}
@end
