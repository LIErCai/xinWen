//
//  NSDictionary+lc.m
//  Runtime
//
//  Created by admin on 16/3/4.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "NSDictionary+lc.h"

@implementation NSDictionary (lc)

- (void)createPropertyCode
{
    NSMutableString *codes = [NSMutableString string];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code;
        if ([obj isKindOfClass:[NSString class]])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")])
       {
           code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
       }else if ([obj isKindOfClass:[NSNumber class]])
       {
           code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;", key];
       }else if ([obj isKindOfClass:[NSDictionary class]])
       {
           code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSDictionary *%@;", key];
       }else if ([obj isKindOfClass:[NSArray class]])
       {
           code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSArray *%@;", key];
       }
        
        [codes appendFormat:@"\n%@\n", code];
    }];
    NSLog(@"%@", codes);
}
@end
