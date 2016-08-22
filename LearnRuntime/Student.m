//
//  Student.m
//  LearnRuntime
//
//  Created by lqq on 16/8/17.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
#import "ForeignStudent.h"
@implementation Student


/*******************动态方法解析************************/
/**
 *  动态绑定类方法
 *
 *  注意： v@: -参考Type Encodings
 *        v :  A void
 *        @ :  An object
 *        : :  A method seletor(SEL)
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

/*******************重定向************************/
/**
 *  重定向
 *
 *  @param aSelector
 *
 *  @return  nil/self 进行消息转发，否则向返回的对象重新发送消息。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(learnChinese:)) {
        return [[ForeignStudent alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

/*******************消息转发************************/
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    ForeignStudent *foreignStu = [[ForeignStudent alloc] init];
    if ([foreignStu respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:foreignStu];
    }  else {
        [super forwardInvocation:anInvocation];
    }
}






@end
