//
//  NSObject+Description.m
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/12.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import "NSObject+Description.h"
#import <objc/runtime.h>

@implementation NSObject (Description)

- (NSString *)descriptionForCls {
    unsigned int count ,i;
    objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (i = 0; i < count; i++) {
        objc_property_t property = propertyArray[i];
        NSString *key = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:key];
        
        if (value) {
            [dic setObject:value forKey:key];
        } else {
            [dic setObject:@"" forKey:key];
        }
    }
    free(propertyArray);
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
@end
