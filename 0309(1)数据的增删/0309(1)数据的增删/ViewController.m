//
//  ViewController.m
//  0309(1)数据的增删
//
//  Created by admin on 16/3/9.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "Wine.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *wines;
@property (nonatomic, weak) UIButton *removeBtn;

@end

@implementation ViewController

- (NSMutableArray *)wines{
    if (_wines == nil)
    {
        NSString *file = [[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil];
        NSArray *wineArr = [NSArray arrayWithContentsOfFile:file];
        NSMutableArray *wines = [NSMutableArray array];
        for (NSDictionary *dict in wineArr)
        {
            Wine *wine = [Wine wineWithDict:dict];
            [wines addObject:wine];
        }
        _wines = wines;
    }
    return _wines;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //1. 添加顶部view
    [self  setupTopView];
    //2. 添加按钮
    [self setupButton];
    
    //3. 添加tableview
    [self setupTableView];
    
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.wines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    Wine *wine = self.wines[indexPath.row];
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"💰 %@", wine.money];
    cell.imageView.image = [UIImage imageNamed:wine.image];
    return cell;
}
- (void)setupTableView
{
    CGFloat tableViewX = 0;
    CGFloat tableViewY = CGRectGetMaxY(self.topView.frame);
    CGFloat tableViewW = self.view.frame.size.width;
    CGFloat tableViewH = self.view.frame.size.height - tableViewY;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(tableViewX,tableViewY , tableViewW, tableViewH) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
- (void)setupTopView
{
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    topView.backgroundColor = [UIColor redColor];
    self.topView = topView;
    [self.view addSubview:topView];
}

- (void)setupButton
{
    UIButton *addBtn = [[UIButton alloc] init];
    addBtn.frame = CGRectMake(0, 0, 50, self.topView.frame.size.height);
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    addBtn.enabled = NO;
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:addBtn];
    
    UIButton *reloadBtn = [[UIButton alloc] init];
    reloadBtn.frame = CGRectMake(50, 0, 50, self.topView.frame.size.height);
    [reloadBtn setTitle:@"更改" forState:UIControlStateNormal];
    reloadBtn.enabled = NO;
     [reloadBtn addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:reloadBtn];
    
    UIButton *removeBtn = [[UIButton alloc] init];
    removeBtn.frame = CGRectMake(100, 0, 50, self.topView.frame.size.height);
    [removeBtn setTitle:@"删除" forState:UIControlStateNormal];
    removeBtn.enabled = NO;
     [removeBtn addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    self.removeBtn = removeBtn;
    [self.topView addSubview:removeBtn];
    
    UIButton *somRemove = [[UIButton  alloc] init];
    [somRemove setTitle:@"批量删除" forState:UIControlStateNormal];
    somRemove.frame = CGRectMake(280, 0, 100, self.topView.frame.size.height);
    [somRemove addTarget:self action:@selector(somRemove) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:somRemove];
}

- (void)somRemove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    self.removeBtn.enabled = YES;
}
- (void)add
{
    Wine *wine = [[Wine alloc] init];
    wine.image = @"new_wine";
    wine.name = @"女儿红";
    wine.money = @"332";
//    [self.wines insertObject:wine atIndex:0];
    [self.wines addObject:wine];
    [self.tableView reloadData];
}

- (void)reload
{
    Wine *wine = self.wines[0];
    wine.money = @"100";
    [self.tableView reloadData];
}

- (void)remove
{
//    [self.wines removeObjectAtIndex:0];
//    [self.tableView reloadData];
    
    NSMutableArray *deleWineArr = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.tableView.indexPathsForSelectedRows)
    {
        [deleWineArr addObject:self.wines[indexPath.row]];
    }
    [self.wines removeObjectsInArray:deleWineArr];
    
    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.wines removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
@end
