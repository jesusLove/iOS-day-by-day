//
//  ViewController.m
//  LearnRuntime
//
//  Created by lqq on 16/8/17.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

#import "LearnRunLoop.h"
#import "User.h"
@interface ViewController ()
@property (nonatomic, strong) Student *stu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    消息转发
//    [self createStudent];
    
    
//    __block关键字的底层实现原理
//    [self changeValueBlock];
    
    
//    添加RunLoopObserver
    [LearnRunLoop addObserverToCurrentRunLoop];
    
//    User *user = [[User alloc] init];
//    [user getIvar];
//    [user getProperty];
}

/**
 *  消息转发机制
 */
- (void)createStudent {
    self.stu = [[Student alloc] init];
    [self.stu goToShool:@"去学校"];
    [Student learnClass:@"学习"];
    [self.stu learnChinese:@"学汉语"];
}


/**
 *  __block关键字的底层实现原理
 *  问题： 在block内如何修改block外部变量？
 */
- (void)changeValueBlock {
    __block int a = 0;
    
    NSLog(@"定义前： %p", &a); //栈区
    void (^foo)(void) = ^{
        a = 1;
         NSLog(@"Block中： %p", &a); //堆区
    };
     NSLog(@"定义后： %p", &a); //堆区
    foo();
}




@end
