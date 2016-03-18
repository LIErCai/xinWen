//
//  MenuOneViewController.m
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "MenuOneViewController.h"
#import "MenuTwoViewController.h"
@interface MenuOneViewController ()

@end

@implementation MenuOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"MenuOneViewController";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}
- (IBAction)jump:(id)sender {
    
    MenuTwoViewController *two = [[MenuTwoViewController alloc] init];
    
    [self.navigationController pushViewController:two animated:YES];
}



@end
