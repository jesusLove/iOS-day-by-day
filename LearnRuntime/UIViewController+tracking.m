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
