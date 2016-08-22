//
//  User.h
//  LearnRuntime
//
//  Created by best－admin on 16/8/19.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+AssociatedObject.h"
@interface User : NSObject {
    NSString *_name;
}
@property NSString *sex;
@property (nonatomic, copy) NSDictionary *dict;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) double tall;
@property (nonatomic, assign) NSUInteger height;

- (void)getIvar;
- (void)getProperty;
@end
