//
//  Student.h
//  LearnRuntime
//
//  Created by lqq on 16/8/17.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  学习消息转发
 *      动态方法解析
 *      重定向
 *      完整消息转发
 */
@interface Student : NSObject
/**
 *  对比类方法和实例方法
 *
 */
+ (void)learnClass:(NSString *) string;
- (void)goToShool:(NSString *) name;

- (void)learnChinese:(NSString *) string;

@end
