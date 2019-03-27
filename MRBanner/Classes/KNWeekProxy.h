//
//  KNWeekProxy.h
//  KKRent
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNWeekProxy : NSProxy

@property (nonatomic,weak,readonly,nullable) id target;

/**
 类方法 创建 弱引用对象

 @param target 当前对象
 @return 当前对象弱引用之后
 */
+ (instancetype)proxyWithTarget:(id)target;

/**
 实例方法 创建 弱引用对象

 @param target 当前对象
 @return 当前对象弱引用之后
 */
- (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
