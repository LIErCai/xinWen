//
//  ViewController.m
//  加法计算器
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UITextField *textFL;
@property (nonatomic, weak) UITextField *textFR;

@property (nonatomic, weak) UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textFL = [[UITextField alloc] init];
    textFL.frame = CGRectMake(20, 50, 90, 30);
    textFL.borderStyle = UITextBorderStyleRoundedRect;
    textFL.placeholder = @"第一个数";
    textFL.font = [UIFont systemFontOfSize:15];
    textFL.keyboardType = UIKeyboardTypeNumberPad;
    self.textFL = textFL;
    [self.view addSubview:textFL];
    
    UILabel *addLabel = [[UILabel alloc] init];
    addLabel.frame = CGRectMake(120, 50, 30, 30);
    addLabel.text = @"+";
    [self.view addSubview:addLabel];
    
    UITextField *textFR = [[UITextField alloc] init];
    textFR.frame = CGRectMake(150, 50, 90, 30);
    textFR.borderStyle = UITextBorderStyleRoundedRect;
    textFR.placeholder = @"第二个数";
    textFR.font = [UIFont systemFontOfSize:15];
    textFR.keyboardType = UIKeyboardTypeNumberPad;
    self.textFR = textFR;
    [self.view addSubview:textFR];
    
    UILabel *isLabel = [[UILabel alloc] init];
    isLabel.frame = CGRectMake(250, 50, 30, 30);
    isLabel.text = @"=";
    [self.view addSubview:isLabel];

    UILabel *resultLabel = [[UILabel alloc] init];
    resultLabel.frame = CGRectMake(280, 50, 100, 30);
    resultLabel.font = [UIFont systemFontOfSize:18];
    resultLabel.text = @"0";
    self.resultLabel = resultLabel;
    [self.view addSubview:resultLabel];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"计算" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 100, 200, 50);
    button.backgroundColor = [UIColor orangeColor];
    [button  setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];

    [button  addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)addButtonClicked:(UIButton *)btn
{
    NSString *textl = self.textFL.text;
    NSString *textr = self.textFR.text;
    if (textl.length == 0)
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"输入有误" message:@"请输入第一个数" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alerView show];
        return;
    }
    if (textr.length == 0)
    {
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"输入有误" message:@"请输入第二个数" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alerView show];
        return ;
    }
    NSInteger result = [textl integerValue] + [textr integerValue];
    self.resultLabel.text = [NSString stringWithFormat:@"%zd", result];
   
}
@end
