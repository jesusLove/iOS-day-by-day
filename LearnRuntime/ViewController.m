//
//  ViewController.m
//  LearnRuntime
//
//  Created by lqq on 16/8/17.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()
@property (nonatomic, strong) Student *stu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createStudent];
}
/**
 动态绑定
 */
- (void)createStudent {
    self.stu = [[Student alloc] init];
    [self.stu goToShool:@"去学校"];
    [Student learnClass:@"学习"];
}

@end
