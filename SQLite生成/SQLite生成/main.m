//
//  main.m
//  SQLite生成
//
//  Created by admin on 16/3/6.
//  Copyright © 2016年 LC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSMutableString *sql = [NSMutableString string];
        NSArray *names = @[@"jack", @"rose", @"jim", @"jake"];
        for (int i = 0; i < 100; i++)
        {
            int index = arc4random()%names.count;
            NSString *namePre = names[index];
            NSString *name = [NSString stringWithFormat:@"%@ -- %d", namePre, arc4random()%100];
            int age = arc4random()%100;
            double score = arc4random() %100;
            [sql appendFormat:@"insert into t_student (name, age, score) values('%@', %d, %f); \n", name, age, score];
        }
        
        [sql writeToFile:@"/Users/admin/Desktop/student.sql" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return 0;
}
