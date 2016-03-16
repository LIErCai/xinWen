//
//  ViewController.m
//  SQLite
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentTool.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *students;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (NSArray *)students{
    if (_students == nil)
    {
        _students = [StudentTool students];
    }
    return _students;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    Student *student = self.students[indexPath.row];
    cell.textLabel.text = student.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", student.age];
    
    return cell;
}
@end
