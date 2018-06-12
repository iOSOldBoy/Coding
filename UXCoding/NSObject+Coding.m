//
//  NSObject+Coding.m
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/12.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import "NSObject+Coding.h"
#import <objc/runtime.h>

@implementation NSObject (Coding)
- (void)encode:(NSCoder *)aCoder {
    unsigned int count = 0;
    //1.获取该类所有的成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        //2.查看成员变量
        const char *name = ivar_getName(ivar);
        //3.根据key获取到对应的value
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        //4.归档
        [aCoder encodeObject:value forKey:key];
    }
    //5.释放
    free(ivars);
}

- (void)decode:(NSCoder *)aDecoder {
    unsigned int count = 0;
    //1.获取该类所有的成员变量
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0 ; i < count; i ++) {
        Ivar ivar = ivars[i];
        //2.查看成员变量
        const char *name = ivar_getName(ivar);
        //3.根据key获取到对应的value
        NSString *key = [NSString stringWithUTF8String:name];
        [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        
    }
    //4.释放
    free(ivars);
}
@end
