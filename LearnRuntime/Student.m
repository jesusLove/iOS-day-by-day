//
//  Student.m
//  LearnRuntime
//
//  Created by lqq on 16/8/17.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student

//+ (void)learnClass:(NSString *)string {
//    NSLog(@"learnClass: %@", string);
//}
/**
 *  动态绑定类方法
 *
 *  @param sel
 *
 *  @return
 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(learnClass:)) {
        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(myClassMethod:)), "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}
/**
 *  方法实现
 *
 *  @param string
 */
+ (void)myClassMethod:(NSString *) string {
    NSLog(@"myClassMethod = %@", string);
}
/**
 *  动态绑定实例方法
 *
 *  @param sel
 *
 *  @return
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(goToShool:)) {
        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(myInstanceMethod:)), "v@:");
        return YES;
    }
    return  [super resolveInstanceMethod:sel];
}
/**
 *  方法实现
 *
 *  @param string
 */
- (void)myInstanceMethod:(NSString *)string {
    NSLog(@"myInstanceMethod = %@", string);
}

/**
 *  注意： 区分[self class] 和 object_getClass(self) ？？？？
 */

@end
