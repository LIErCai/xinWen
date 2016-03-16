//
//  ViewController.m
//  0313(1)菜谱
//
//  Created by admin on 16/3/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSArray *foods;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
}

- (NSArray *)foods{
    if (_foods == nil)
    {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
     
    }
    return _foods;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *arr = self.foods[component];
    return arr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *arr = self.foods[component];
    return arr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *arr = self.foods[component];
    NSString *text = arr[row];
    self.label.text = text;
}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    NSArray *arr = self.foods[component];
//    NSString *text =  arr[row];
//    return [text.at ;
//}
@end
