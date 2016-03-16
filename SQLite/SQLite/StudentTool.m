//
//  StudentTool.m
//  SQLite
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "StudentTool.h"
#import <sqlite3.h>
#import "Student.h"
@implementation StudentTool

static sqlite3 *_db;
+ (void)initialize
{
    //1. 现在沙盒中获得数据库
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"student.sqlite"];
    //2. 打开数据库
    int result = sqlite3_open(filename.UTF8String, &_db);
    if (result == SQLITE_OK)
    {
        //3. 创表
        const char *sql = "creat table if not exists t_student (id integer primary key autoincrement, name text, age integer)";
        char *errMsg = NULL;
        int result = sqlite3_exec(_db, sql, NULL, NULL, &errMsg);
        if (result == SQLITE_OK)
        {
            NSLog(@"创建成功");
        }else
        {
            NSLog(@"创建失败");
        }
    }else
    {
        NSLog(@"打开数据库失败");
    }
    
}
+ (NSArray *)students
{
    NSMutableArray *students = nil;
    const char *sql = "select id, name, age from t_student;";
    //1. 检测SQL语句的合法性
    sqlite3_stmt *stmt = NULL;
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK)
    {
        students = [NSMutableArray array];
        //2. 执行SQL语句, 从结果取出数据
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Student *student = [[Student alloc] init];
            student.ID = sqlite3_column_int(stmt, 0);
           const unsigned char *sname = sqlite3_column_text(stmt, 1);
            student.name = [NSString stringWithUTF8String:(const char *)sname];
            student.age = sqlite3_column_int(stmt, 2);
            
            [students addObject:student];
        }
        
    }else
    {
        NSLog(@"查询语句非法");
    }
    return students;
}
@end
