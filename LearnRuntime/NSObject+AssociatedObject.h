//
//  NSObject+AssociatedObject.h
//  LearnRuntime
//
//  Created by best－admin on 16/8/19.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  关联对象AssociateObject
 *  给现有的类添加自定义属性
 */
@interface NSObject (AssociatedObject)
@property (nonatomic, strong) id assoctateObject;
@end
