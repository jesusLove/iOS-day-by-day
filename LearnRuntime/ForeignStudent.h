//
//  ForeignStudent.h
//  LearnRuntime
//
//  Created by best－admin on 16/8/18.
//  Copyright © 2016年 LQQ. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Student重定向到ForeignStudent,将消息发送给ForeignStudent;
 */
@interface ForeignStudent : NSObject
- (void)learnChinese:(NSString *) string;
@end
