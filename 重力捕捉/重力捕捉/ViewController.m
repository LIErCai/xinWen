//
//  ViewController.m
//  重力捕捉
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sefmentControl;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

/**
 *  创建一个物理仿真器
 *
 */
- (UIDynamicAnimator *)animator
{
    if (_animator == nil)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.blueView snapToPoint:point];
    snap.damping = 2;
    [self.animator removeAllBehaviors];
    [self.animator addBehavior:snap];
}
- (void)test3
{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.sefmentControl]];
    
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 300, 500)];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 100, 300, 300)];
    [collision addBoundaryWithIdentifier:@"cirlce" forPath:path];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}
- (void)test2
{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    gravity.magnitude = 3;
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.sefmentControl, self.blueView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)test1
{
    //1. 创建物理仿真行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    //2. 创建碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.sefmentControl]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    //3. 添加物理仿真行为到物理仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];

}
@end
