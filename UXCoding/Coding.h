//
//  Coding.h
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/8.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Coding : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSMutableArray *friends;
@property (nonatomic, strong) NSMutableDictionary *favarateFood;

@end
