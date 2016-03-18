//
//  LCFoodDetailViewController.m
//  LCSplitViewController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "LCFoodDetailViewController.h"
#import "LCFoodItem.h"
@interface LCFoodDetailViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation LCFoodDetailViewController

- (void)loadView
{
    UIWebView *web = [[UIWebView alloc] init];
    web.frame = [UIScreen mainScreen].bounds;
    self.view = web;
    self.webView = web;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.foodItem.name;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"Html/food/%@", self.foodItem.idstr] withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
