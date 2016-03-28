//
//  ViewController.m
//  选择图片
//
//  Created by admin on 16/3/28.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import <CTAssetsPickerController.h>
@interface ViewController ()<CTAssetsPickerControllerDelegate ,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray  *images;

@end

@implementation ViewController


- (NSMutableArray *)images
{
    if (_images == nil)
    {
        _images = [NSMutableArray array];
    }
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self loadMoreImage];
}


- (void)loadMoreImage
{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
            picker.showsEmptyAlbums = NO;
            picker.delegate = self;
//            picker.showsCancelButton = YES;
//            picker.showsNumberOfAssets = YES;
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                picker.modalPresentationStyle = UIModalPresentationFormSheet;
            }
            [self presentViewController:picker animated:YES completion:nil];
        });
    }];
}

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(PHAsset *)asset
{
    NSInteger max = 9;
    if (picker.selectedAssets.count < max)  return YES;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"最多可选9张图片" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil ]];
    [picker presentViewController:alert animated:YES completion:nil];
    return NO;
}
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = w;
    NSInteger col = 4;
    CGFloat margin = 10;
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < assets.count; i++)
    {
//        x = (i % col) * (w + margin);
//        y = (i / col) * (w + margin);
        UIImageView *imageView = [[UIImageView alloc] init];
//         imageView.frame = CGRectMake(x, y, w, h);
        PHAsset *asset = assets[i];
        CGSize size = CGSizeMake(asset.pixelWidth / [UIScreen mainScreen].scale, asset.pixelHeight/[UIScreen mainScreen].scale);
        
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
           
            imageView.image = result;
            [array addObject:imageView];
//            [self.view addSubview:imageView];
        }];
   }
    [self.images addObjectsFromArray:array];
    for (NSInteger j = 0; j < self.images.count; j++)
    {
        x = (j % col) * (w + margin);
        y = (j / col) * (w + margin);
        
        UIImageView *imageView = self.images[j];
        imageView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:imageView];
    }
    
}

//- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
//{
//    
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    
//    CGFloat x = 0;
//    CGFloat y = 0;
//    CGFloat w = 70;
//    CGFloat h = w;
//    NSInteger col = 4;
//    CGFloat margin = 10;
//    for(NSInteger i = 0; i < assets.count; i++)
//    {
//        x = (i % col) * (w + margin);
//        y = (i / col) * (w + margin);
//        
//        PHAsset *asset = assets[i];
//        CGSize size = CGSizeMake(asset.pixelWidth / [UIScreen mainScreen].scale, asset.pixelHeight/[UIScreen mainScreen].scale);
//        
//        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
//            
//            imageView.image = result;
//            [self.images addObject:imageView];
//            [self.view addSubview:imageView];
//        }];
//       
//        
//    }
//    
//}
/**
 *  本地化
 */
- (void)localizable
{
    UILabel *label = [[UILabel alloc] init];
    label.text = NSLocalizedString(@"go", @"run, run");
    NSString *string = NSLocalizedStringFromTable(@"Done", @"Test", @"a ");
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:btn];
    [btn setTitle:string forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

}
/**
 *  单张照片的选择
 */
- (void)imagePick
{
    UIAlertController *alerController = [UIAlertController  alertControllerWithTitle:@"请选择方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alerController addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openPhotos];
    }]];
    [alerController addAction:[UIAlertAction actionWithTitle:@"照相机" style:
                               UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                   [self openCamera];
                               }]];
    [self presentViewController:alerController animated:YES completion:nil];
}
- (void)openCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)openPhotos
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
}
@end
