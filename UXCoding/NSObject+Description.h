//
//  NSObject+Description.h
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/12.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Description)
- (NSString *)descriptionForCls;
@end

NS_ASSUME_NONNULL_END
#define DescriptionImpletion \
- (NSString *)description { \
return [self descriptionForCls]; \
} \
