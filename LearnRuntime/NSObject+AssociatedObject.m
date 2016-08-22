//
//  NSObject+AssociatedObject.m
//  LearnRuntime
//
//  Created by best－admin on 16/8/19.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
@implementation NSObject (AssociatedObject)

- (void)setAssoctateObject:(id)assoctateObject {
    objc_setAssociatedObject(self, @selector(assoctateObject), assoctateObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)assoctateObject {
    return objc_getAssociatedObject(self, @selector(assoctateObject));
}
@end
