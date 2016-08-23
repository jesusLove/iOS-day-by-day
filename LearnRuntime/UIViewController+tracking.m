//
//  UIViewController+tracking.m
//  LearnRuntime
//
//  Created by best－admin on 16/8/18.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "UIViewController+tracking.h"
#import <objc/runtime.h>
@implementation UIViewController (tracking)

/**
 *  理解： [self class] 和 object_getClass(self)区别和联系？
 */
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class]; //注意：如果是类方法，则需要 Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        
        
        
        //注意： 在交换方法实现，需要判断原有方法实现是否存在，存在才能交换
        // 如何判断？添加原有方法，如果成功，表示原有方法不存在，失败，表示原有方法存在
        // 原有方法可能没有实现，所以这里添加方法实现，用自己方法实现
        // 这样做的好处：方法不存在，直接把自己方法的实现作为原有方法的实现，调用原有方法，就会来到当前方法的实现
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}
/**
 *  添加自定义的方法
 *
 *  @param animated 
 */
- (void)xxx_viewWillAppear: (BOOL) animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@", self);
}

@end
