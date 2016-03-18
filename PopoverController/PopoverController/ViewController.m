//
//  ViewController.m
//  PopoverController
//
//  Created by admin on 16/3/17.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "MenuOneViewController.h"
#import "TitleViewController.h"
#import "ColorPickerViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftItem;
@property (weak, nonatomic) IBOutlet UIButton *titleItem;
@property (weak, nonatomic) IBOutlet UIButton *colorButton;

//@property (nonatomic, strong) UIPopoverPresentationController *menuPopover;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)menuClicked:(id)sender {
    
    MenuOneViewController *one = [[MenuOneViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:one];
    nav.modalPresentationStyle = UIModalPresentationPopover;
    nav.popoverPresentationController.sourceView = (UIView *)self.leftItem;
    
    nav.popoverPresentationController.sourceRect = self.leftItem.bounds;
    
    [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)titleClicked:(id)sender {
    
    TitleViewController *titleVc = [[TitleViewController alloc] init];
    titleVc.modalPresentationStyle = UIModalPresentationPopover;
    titleVc.popoverPresentationController.sourceView = self.titleItem;
    titleVc.popoverPresentationController.sourceRect = self.titleItem.bounds;
    
    [self presentViewController:titleVc animated:YES completion:nil];
}
- (IBAction)colorButtonClicked:(id)sender {
    
    ColorPickerViewController *colorVc = [[ColorPickerViewController alloc] init];
    colorVc.color = ^(UIColor *color){
        self.colorButton.backgroundColor = color;
    };
    colorVc.modalPresentationStyle = UIModalPresentationPopover;
    colorVc.popoverPresentationController.sourceRect = self.colorButton.bounds;
    colorVc.popoverPresentationController.sourceView = self.colorButton;
    [self presentViewController:colorVc animated:YES completion:nil];
}

@end
