//
//  User.m
//  LearnRuntime
//
//  Created by best－admin on 16/8/19.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import "User.h"
#import <objc/runtime.h>

/**
 * 应用实例
 *      JSON到Model的转换:
 *      快速归档
 *      访问私有变量
 */
@implementation User

/**
 *  成员变量
 */
- (void)getIvar{
    unsigned int count = 0;
    //获取所有的成员变量
    Ivar *ivars = class_copyIvarList([User class], &count);
    
    for (unsigned i = 0; i < count;  i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar); //成员变量名称
        const char *type = ivar_getTypeEncoding(ivar); //成员变量类型
        NSLog(@"类型 %s 的 %s", type, name);
    }
    free(ivars);
}
/**
 *  属性
 属性类型  name值：T                                           value：变化
 编码类型  name值：C(copy) &(strong) W(weak) 空(assign) 等      value：无
 非/原子性 name值：空(atomic) N(Nonatomic)                      value：无
 变量名称  name值：V                                            value：变化
 */
- (void)getProperty {
    unsigned int count = 0;
    objc_property_t * properties = class_copyPropertyList([User class], &count);
    
    for (unsigned i = 0; i < count;  i ++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        const char *propertyAttr = property_getAttributes(property);
        NSLog(@"属性描述为%s的%s", propertyAttr, name);
        unsigned int  attrCount = 0;
        
        objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);
        for (unsigned i = 0; i < attrCount; i ++) {
            objc_property_attribute_t attr = attrs[i];
            const char *name = attr.name;
            const char *value = attr.value;
            NSLog(@"属性的描述:%s值：%s", name, value);
        }
        free(attrs);
        NSLog(@"\n");
    }
    free(properties);
}









@end
