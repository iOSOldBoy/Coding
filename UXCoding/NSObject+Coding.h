//
//  NSObject+Coding.h
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/12.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Coding)
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;
@end

NS_ASSUME_NONNULL_END
#define CodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode:encoder]; \
}

