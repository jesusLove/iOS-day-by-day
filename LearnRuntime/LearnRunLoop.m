//
//  LearnRunLoop.m
//  LearnRuntime
//
//  Created by best－admin on 16/8/19.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "LearnRunLoop.h"
@implementation LearnRunLoop

/**
 *  RunLoopObserver
 */
+ (void)addObserverToCurrentRunLoop {
    //获取当前进程Runloop
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    if (!runloop) {
        return;
    }
    
    if (runloop == [NSRunLoop mainRunLoop]) {
        NSLog(@"Current runloop is the main runloop");
    } else {
        NSLog(@"Current runloop is not the main runloop");
    }
    
    //创建RunLoopObserver运行上下文
    CFRunLoopObserverContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
    
    /**
     *  创建RunLoopObserver对象
     *
     *  @param kCFAllocatorDefault    分配内存
     *  @param kCFRunLoopBeforeTimers 检测状态
     *  @param YES                    是否循环
     *  @param 0                      优先级
     *  @param NULL                   回调函数
     *  @param context                运行上下文
     *
     *  @return 返回observer
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallBack, &context);
    
    if (observer) {
        //将Cocoa的NSRunLoop类型转换为CoreFoundation的CFRunLoopRef类型
        CFRunLoopRef cfloop = [runloop getCFRunLoop];
        //将新键的observer加到当前的thread的RunLoop中。
        CFRunLoopAddObserver(cfloop, observer, kCFRunLoopDefaultMode);
    }
}
static void runLoopObserverCallBack(CFRunLoopObserverRef observer,  CFRunLoopActivity activity, void *info)
{
    switch (activity) {
        case kCFRunLoopEntry: {
            NSLog(@"run loop entry");
            break;
        }
        case kCFRunLoopBeforeTimers: {
            NSLog(@"run loop beforeTimers");
            break;
        }
        case kCFRunLoopBeforeSources: {
            NSLog(@"run loop beforeSources");
            break;
        }
        case kCFRunLoopBeforeWaiting: {
            NSLog(@"run loop beforeWaiting");
            break;
        }
        case kCFRunLoopAfterWaiting: {
            NSLog(@"run loop afterWaiting");
            break;
        }
        case kCFRunLoopExit: {
            NSLog(@"run loop exitWaiting");
            break;
        }
        case kCFRunLoopAllActivities: {
            NSLog(@"run loop all ");
            break;
        }
    }
}

@end
