//
//  ViewController.m
//  UXCoding
//
//  Created by 刘瑞 on 2018/6/8.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import "ViewController.h"
#import "Coding.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Coding *coding1 = [[Coding alloc] init];
    coding1.name = @"小明";
    coding1.age = 12;
    coding1.friends = [@[@"刘瑞",@"刘瑞1"] mutableCopy];
    coding1.favarateFood = [@{@"早餐":@"粥",
                             @"午餐":@"稀饭"
                             } mutableCopy];
    NSLog(@"%@ %ld",coding1.name,coding1.age);
    Coding *coding2 = [[Coding alloc] init];
    coding2.name = @"小王";
    coding2.age = 20;
    NSLog(@"%@ %ld",coding2.name,coding2.age);
    NSArray *array = @[coding1,coding2];
    NSString*tempPath = NSTemporaryDirectory();
//    // 拼接文件名
    NSString*filePath = [tempPath stringByAppendingPathComponent:@"coding.data"];
//                         // 归档
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (success) {
        NSLog(@"成功");
    } else {
        NSLog(@"失败");
    }
    
    

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"读取" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 100, 40)];
    [button setCenter:self.view.center];
}

- (void)click {
    NSString*tempPath = NSTemporaryDirectory();
    //    // 拼接文件名
    NSString*filePath = [tempPath stringByAppendingPathComponent:@"coding.data"];
    NSArray *array1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    for (Coding *coding in array1) {
        NSLog(@"%@",coding);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
